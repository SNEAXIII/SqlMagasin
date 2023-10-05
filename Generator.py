def parseFile(fileContent):
    return [line.strip().split(",") for line in fileContent]


def parseColumn(_list):
    return ",".join(_list)


def isNumber(string):
    return string.replace(" ", "").replace(".", "").isdigit()


def isEmpty(string):
    return string.strip() == ""


def parseValues(line):
    result = []
    for elem in line:
        if isNumber(elem):
            result.append(elem)
        elif isEmpty(elem):
            result.append("Null")
        else:
            result.append(f"'{elem}'")
    return ",".join(result)


files = ["CATEGORIE.csv", "PRODUIT.csv", "MAGASIN.csv", "EMPLOYE.csv", "VEND.csv", "POSSEDE.csv"]

with open("request.sql", "w", encoding="utf-8") as sql:
    for file in files:
        with open(file, "r", encoding="utf-8") as csv:
            fileName = file.split(".")[0]
            content = csv.readlines()
            column = parseColumn(content[0].strip().split(","))
            rows = parseFile(content[1:])
            for line in rows:
                values = parseValues(line)
                sql.write(f"INSERT INTO {fileName} ({column}) VALUES ({values});\n")
with open("reload.sql", "w", encoding="utf-8") as reload:
    with open("dropAndCreateTable.sql", "r", encoding="utf-8") as dropAndCreate:
        reload.write(dropAndCreate.read())
    with open("request.sql", "r", encoding="utf-8") as request:
        reload.write(request.read())
