# README

Official code for "Assessing the GPT Series in Smart Contract Vulnerability Repair: An Empirical Study" which has been submitted to ICSE 2026

## File Information

### Related files for LLM-based contract vulnerability repair

```
├── analysis.log
├── config.py
├── data_preprocessing.py : Functions that perform vulnerability contract preprocessing
├── datasets
│   ├── dataset0 : The merged and manually reviewed dataset contains 1,290 contracts as well as 1,410 vulnerabilities
│   ├── dataset1 : Pre-processed contract vulnerability data and contract data after LLM repair
│   └── README.md
├── gpt_query.py : Only fix a single vulnerability per contract
├── gpt_query_ret_json.py : Each contract only fixes a single vulnerability and returns it in json format
├── README.md
├── result_processing.py : Contract repair based on GPT results
└── utils.py
```

### Related files when traditional contract vulnerability repair tools

### Related files when using LLM to optimize legacy vulnerability repair tools

### Relevant documents in Discussion
