import csv
from collections import Counter
import os

def get_duplicate_files_from_csv(csv_file_path):
    file_counter = Counter()
    with open(csv_file_path, mode='r', encoding='utf-8') as csvfile:
        csvreader = csv.DictReader(csvfile)
        for row in csvreader:
            file_counter[row['file']] += 1
    
    # 打印文件名总数（不重复）
    print(f"共有 {len(file_counter)} 个文件名在 CSV 文件中。")
    # 找到出现次数大于 1 的文件名
    duplicate_files = {file for file, count in file_counter.items() if count > 1}
    return duplicate_files

def rename_files_based_on_csv(csv_file_path, dir1_path):
    files_to_rename = []
    with open(csv_file_path, mode='r', encoding='utf-8') as csvfile:
        csvreader = csv.DictReader(csvfile)
        for row in csvreader:
            file_name = row['file']
            vul_name = row['vul']
            files_to_rename.append((file_name, vul_name))
    
    for file_name, vul_name in files_to_rename:
        old_file_path = os.path.join(dir1_path, f"{file_name}.sol")
        new_file_path = os.path.join(dir1_path, f"{file_name}_{vul_name}.sol")
        if os.path.exists(old_file_path):
            os.rename(old_file_path, new_file_path)
            # print(f"文件 {old_file_path} 已重命名为 {new_file_path}")
        else:
            print(f"文件 {old_file_path} 不存在")

        

def main():
    csv_file_path = '/home/ys/project/openaiAPI/datasets/dataset0/vul_info.csv'  # CSV 文件路径
    dir1_path = '/home/ys/project/openaiAPI/datasets/dataset1/vul_functions'  # 数据集1目录路径
    
    # 检查哪些文件file_vul是csv文件中有而文件夹中没有的
    csv_file_vul = []
    # 读取csv文件，获取文件名
    with open(csv_file_path, mode='r', encoding='utf-8') as csvfile:
        csvreader = csv.DictReader(csvfile)
        for row in csvreader:
            file_name = row['file']
            vul_name = row['vul']
            file_vul = f'{file_name}({vul_name}).sol'
            # 转小写
            file_vul = file_vul.lower()
            csv_file_vul.append(file_vul)   
    # 获取文件夹中的文件
    dir1_files = os.listdir(dir1_path)
    # 找出文件夹中有而csv文件中没有的文件
    dir1_files_not_in_csv = set(dir1_files) - set(csv_file_vul)
    print(f"文件夹中有而csv文件中没有的文件：{dir1_files_not_in_csv}")
    csv_not_in_dir1 = set(csv_file_vul) - set(dir1_files)
    print(f"csv文件中有而文件夹中没有的文件：{csv_not_in_dir1}")
        


main()