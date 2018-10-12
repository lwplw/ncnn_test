![](https://raw.githubusercontent.com/Tencent/ncnn/master/images/256-ncnn.png)
# ncnn

[![License](https://img.shields.io/badge/license-BSD--3--Clause-blue.svg)](https://raw.githubusercontent.com/Tencent/ncnn/master/LICENSE.txt) 
[![Build Status](https://travis-ci.org/Tencent/ncnn.svg?branch=master)](https://travis-ci.org/Tencent/ncnn)
[![Coverage Status](https://coveralls.io/repos/github/Tencent/ncnn/badge.svg?branch=master)](https://coveralls.io/github/Tencent/ncnn?branch=master)


ncnn is a high-performance neural network inference computing framework optimized for mobile platforms. ncnn is deeply considerate about deployment and uses on mobile phones from the beginning of design. ncnn does not have third party dependencies. it is cross-platform, and runs faster than all known open source frameworks on mobile phone cpu. Developers can easily deploy deep learning algorithm models to the mobile platform by using efficient ncnn implementation, create intelligent APPs, and bring the artificial intelligence to your fingertips. ncnn is currently being used in many Tencent applications, such as QQ, Qzone, WeChat, Pitu and so on.

ncnn 是一个为手机端极致优化的高性能神经网络前向计算框架。ncnn 从设计之初深刻考虑手机端的部署和使用。无第三方依赖，跨平台，手机端 cpu 的速度快于目前所有已知的开源框架。基于 ncnn，开发者能够将深度学习算法轻松移植到手机端高效执行，开发出人工智能 APP，将 AI 带到你的指尖。ncnn 目前已在腾讯多款应用中使用，如 QQ，Qzone，微信，天天P图等。

---

### 功能概述

* 支持卷积神经网络，支持多输入和多分支结构，可计算部分分支
* 无任何第三方库依赖，不依赖 BLAS/NNPACK 等计算框架
* 纯 C++ 实现，跨平台，支持 android ios 等
* ARM NEON 汇编级良心优化，计算速度极快
* 精细的内存管理和数据结构设计，内存占用极低
* 支持多核并行计算加速，ARM big.LITTLE cpu 调度优化
* 整体库体积小于 500K，并可轻松精简到小于 300K
* 可扩展的模型设计，支持 8bit 量化和半精度浮点存储，可导入 caffe/pytorch/mxnet/onnx 模型
* 支持直接内存零拷贝引用加载网络模型
* 可注册自定义层实现并扩展
* 恩，很强就是了，不怕被塞卷 QvQ

---

### Example
* https://blog.csdn.net/lwplwf/article/details/83016219
* https://blog.csdn.net/lwplwf/article/details/82983904
* https://blog.csdn.net/lwplwf/article/details/82842586
