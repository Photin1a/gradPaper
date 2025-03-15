import re

# 打开文件并读取内容
with open('./document.tex', 'r', encoding='utf-8') as file:
    text = file.read()

# 使用正则表达式匹配中文字符
chinese_chars = re.findall(r'[\u4e00-\u9fa5]', text)

# 输出中文字符的数量
print(f"中文字符数量: {len(chinese_chars)-300}")
