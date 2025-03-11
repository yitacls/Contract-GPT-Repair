## 说明
检测结果详见：https://www.notion.so/Empirical-Study-3f8f0dceb86048bc9d774d8667c7959e?pvs=18
使用基于GPT的prompt engineering，测试GPT修复合约漏洞效果

### 数据集
dataset_test 为随机抽取的合约样本，用于测试批量检测文件夹下代码
dataset0为来自缪整理的漏洞数据集，
- csv文件+文件夹（合约代码）
    - csv文件：
        - 合约地址：链上地址
        - 漏洞文件的相对路径
        - 合约版本:没有的话，人工判断版本。GPT确定大概版本+人工编译合约通过
        - 合约大小：代码总行数
        - 漏洞类型：DASP10
        - 漏洞所在行数
    - 文件夹
        - xlsx文件对应的合约文件,来自于Notion上的附件3 sum （确定的DASP10漏洞数据集）
dataset1为切割后的数据集
    vul_functions为漏洞所在函数
reentrancy：忽略

### 代码

data_preprocessing.py