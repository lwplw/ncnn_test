// Tencent is pleased to support the open source community by making ncnn available.
//
// Copyright (C) 2018 THL A29 Limited, a Tencent company. All rights reserved.
//
// Licensed under the BSD 3-Clause License (the "License"); you may not use this file except
// in compliance with the License. You may obtain a copy of the License at
//
// https://opensource.org/licenses/BSD-3-Clause
//
// Unless required by applicable law or agreed to in writing, software distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

#include <stdio.h>
#include <vector>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <sys/time.h>
#include "net.h"

struct Object
{
    cv::Rect_<float> rect;
    int label;
    float prob;
};

static int detect_yolov2(const cv::Mat& bgr, std::vector<Object>& objects, const char* parampath, const char* modelpath)
{
    ncnn::Net yolov2;
    
    // 加载模型文件
    yolov2.load_param(parampath);
    yolov2.load_model(modelpath);
    
    // 如果输入图像为3通道，则ncnn的输入在这里需要将cv::imread读到的BGR转为RGB，使用ncnn::Mat::PIXEL_BGR2RGB
    const int target_size = 416;
    int img_w = bgr.cols;
    int img_h = bgr.rows;
    ncnn::Mat in = ncnn::Mat::from_pixels_resize(bgr.data, ncnn::Mat::PIXEL_BGR2RGB, bgr.cols, bgr.rows, target_size, target_size);

    // the Caffe-YOLOv2-Windows style
    // X' = X * scale - mean
    const float mean_vals[3] = {0.5f, 0.5f, 0.5f};
    const float norm_vals[3] = {0.007843f, 0.007843f, 0.007843f};
    in.substract_mean_normalize(mean_vals, norm_vals);

    ncnn::Extractor ex = yolov2.create_extractor();
    ex.set_num_threads(4);

    ex.input("data", in);

    ncnn::Mat out;
    
    // 检测时间
    timeval t1, t2;
    double t;
	gettimeofday(&t1, NULL);
    
    ex.extract("detection_out", out);
    
	gettimeofday(&t2, NULL);
	t = (t2.tv_sec - t1.tv_sec) * 1000.0;
	t += (t2.tv_usec - t1.tv_usec) / 1000.0;
	printf("detection time: %f ms\n", t);

    printf("%d %d %d\n", out.w, out.h, out.c);
    objects.clear();
    for (int i=0; i<out.h; i++)
    {
        const float* values = out.row(i);

        Object object;
        object.label = values[0];
        object.prob = values[1];
        object.rect.x = values[2] * img_w;
        object.rect.y = values[3] * img_h;
        object.rect.width = values[4] * img_w - object.rect.x;
        object.rect.height = values[5] * img_h - object.rect.y;

        objects.push_back(object);
    }
    
    if (objects.size()==0)
        printf("no object\n");
    return 0;
}

static void draw_objects(const cv::Mat& bgr, const std::vector<Object>& objects)
{
    static const char* class_names[] = {"hold", "stop", "shutter"};
        
    cv::Mat image = bgr.clone();

    for (size_t i = 0; i < objects.size(); i++)
    {
        const Object& obj = objects[i];

        fprintf(stderr, "%d = %.5f at %.2f %.2f %.2f x %.2f\n", obj.label, obj.prob,
                obj.rect.x, obj.rect.y, obj.rect.width, obj.rect.height);
                
        cv::rectangle(image, obj.rect, cv::Scalar(255, 0, 0), 2);

        char text[256];
        sprintf(text, "%s %.1f%%", class_names[obj.label], obj.prob * 100);

        int baseLine = 0;
        cv::Size label_size = cv::getTextSize(text, cv::FONT_HERSHEY_SIMPLEX, 0.5, 1, &baseLine);

        int x = obj.rect.x;
        int y = obj.rect.y - label_size.height - baseLine;
        if (y < 0)
            y = 0;
        if (x + label_size.width > image.cols)
            x = image.cols - label_size.width;

        cv::rectangle(image, cv::Rect(cv::Point(x, y),
                                      cv::Size(label_size.width, label_size.height + baseLine)),
                      cv::Scalar(255, 255, 255), CV_FILLED);

        cv::putText(image, text, cv::Point(x, y + label_size.height),
                    cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 0, 0));
                
        printf("drawing box...\n");
    }
    
    printf("draw box done!\n");
    cv::imwrite("test.jpg", image);
    // cv::imshow("image", image);
    // cv::waitKey(0);
}

int main(int argc, char** argv)
{
    if (argc != 4)
    {
        fprintf(stderr, "Usage: %s [parampath] [modelpath] [imagepath]\n", argv[0]);
        return -1;
    }

    const char* parampath = argv[1];
    const char* modelpath = argv[2];
    const char* imagepath = argv[3];

    cv::Mat m = cv::imread(imagepath, CV_LOAD_IMAGE_COLOR);
    if (m.empty())
    {
        fprintf(stderr, "cv::imread %s failed\n", imagepath);
        return -1;
    }

    std::vector<Object> objects;
    
    // 检测目标
    detect_yolov2(m, objects, parampath, modelpath);
    
    // 画box
    draw_objects(m, objects);
    
    return 0;
}
