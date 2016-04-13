
import re
string = """CFLVNLNADPALNELLVYYLKEHTLIGSANSQDIQLCGMGILPEHCIIDITSEGQVMLTPQKNTRTFVNGSSVSSPIQLHHGDRILWGNNHFFRLNLP
LATAPVNQIQETISDNCVVIFSKTSCSYCTMAKKLFHDMNVNYKVVELDLLEYGNQFQDA LYKMTGERTVPRIFVNGTFIGGATDTHRLHKEGKLLPLVHQCYL"""

data = re.finditer(r'(\w{5}C\w{5})', string)
output = []
if data:
    for result in data:
        output.append("".join(result.groups()))
print output
# ['QDIQLCGMGIL', 'TISDNCVVIFS', 'TSCSYCTMAKK']

