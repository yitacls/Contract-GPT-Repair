### Contract Repair Dataset

```
.
├── analysis.log
├── config.py
├── data_preprocessing.py :Slicing the vulnerable function
├── datasets
│   ├── dataset0 :Contract Dataset
│   ├── dataset1 :Sliced and repaired dataset
│   └── README.md
├── gpt_query.py ：Only fix a single vulnerability per contract
├── gpt_query_ret_json.py ：Each contract only fixes a single vulnerability and returns it in json format
├── README.md
├── result_processing.py : Contract repair based on GPT results
└── utils.py
```
