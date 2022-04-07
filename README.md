# ZCU111 RF data converter 测试工程

实现在Zynq Linux下，通过dma实现QPSK收发功能。

## 文件结构

- Hardware
  - zynq_dma_qpsk_tx_10Mbps.tcl  工程Block Design创建脚本
  - QPSK_data_converter.v        将32bits数据映射到I Q通道
  - Repeater.v                   I Q 数据重复模块，用于成形滤波器预处理
- Software
  - device-tree 设备树文件
  - dma-proxy   Kernel driver module
  - dma-sender  Linux user application.

## Usage

### 创建Vivado工程

创建Vivado工程，选择器件为“Board ZCU111”

添加QPSK_data_converter.v 和 Repeater.v 到工程中。

创建空白Block Design

在TCL console中 `source zynq_dma_qpsk_tx_10Mbps.tcl` 自动绘制Block Design

### 创建Petalinux工程

根据Vivado导出的hdf文件，创建工程。

在petalinux工程中添加设备树文件、kernel module文件。

## Refs

[Linux DMA From User Space 2.0](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1027702787/Linux+DMA+From+User+Space+2.0)
