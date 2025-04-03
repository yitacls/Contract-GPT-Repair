# README

Official code for "Assessing the GPT Series in Smart Contract Vulnerability Repair: An Empirical Study" which has been submitted to ICSE 2026

## File Information

### Related files for LLM-based contract vulnerability repair

```
.
├── analysis.log
├── config.py
├── data_preprocessing.py : Functions that perform vulnerability contract preprocessing
├── datasets
│   ├── dataset0 : The merged and manually reviewed dataset contains 1,290 contracts as well as 1,410 vulnerabilities
│   ├── dataset1 : Pre-processed contract vulnerability data and contract data after LLM repair
│   └── README.md
├── gpt_check_vul.py ：Check the contract for vulnerabilities
├── gpt_query.py : Only fix a single vulnerability per contract
├── gpt_query_ret_json.py : Each contract only fixes a single vulnerability and returns it in json format
├── README.md
├── result_processing.py : Contract repair based on GPT results
└── utils.py
```

### Related files when traditional contract vulnerability repair tools

```
.
├── ely.py : Main script for batch processing with traditional tools
├── sguard : Directory contain sguard tool repair results
├── Sguardplus: Directory contain Sguardplus tool repair results
├── smartfix: Directory contain smartfix tool repair results
├── solcversion.py: Script for change Solidity compiler versions
└── tips: Directory contain tips tool repair results
```

### Related files when using LLM to optimize legacy vulnerability repair tools

```
.
├── gpt-downgrade.py : Downgrading version of contracts with LLM
├── gpt-detect.py : Detecting vulnerabilities with LLM
└── tips.py: Repairing contract use the TIPS
```

### Relevant documents in Discussion

```
.
└── README.md ：Record the prompt format used, the code and the existing LLM repair part are known
```
