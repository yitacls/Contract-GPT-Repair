### Contract Repair Dataset
data_preprocessing.py 是
gpt_query.py 每个合约只修复单个漏洞
gpt_query_ret_json.py 每个合约只修复单个漏洞
result_processing.py 基于修复后的合约进行替换
.
├── analysis.log
├── config.py
├── data_preprocessing.py :Slicing the vulnerable function
├── datasets
│   ├── dataset0 :Contract Dataset
│   ├── dataset1 :Sliced ​​and repaired dataset
│   └── README.md
├── gpt_query.py ：Only fix a single vulnerability per contract
├── gpt_query_ret_json.py ：Each contract only fixes a single vulnerability and returns it in json format
├── README.md
├── result_processing.py : Contract repair based on GPT results
└── utils.py