def parseFile(elem):
    result = []
    for line in elem:
        result.append(line.replace("\n", "").split(","))
    return result


def genereEntete(line):
    result = ""
    for elem in line:
        result += f"{elem},"
    return result[:-1]


def parseValue(line):
    result = ""
    for elem in line:
        if elem.replace(" ", "").replace(".", "").isdigit():
            result += f"{elem},"
        elif elem == "":
            result += "Null,"
        else:
            result += f"\'{elem}\',"
    return result[:-1]


files = ["CATEGORIE.csv", "PRODUIT.csv", "MAGASIN.csv", "EMPLOYE.csv", "VEND.csv", "POSSEDE.csv"]

with open("request.sql", "w", encoding="utf-8") as sql:
    for file in files:

        with open(file, "r", encoding="utf-8") as csv:
            nomFichier = file.split(".")[0]
            print(nomFichier)

            content = csv.readlines()
            entete = content[0].replace("\n", "").split(",")
            data = parseFile(content[1:])
            for line in data:
                sql.write(f"INSERT INTO {nomFichier} ({genereEntete(entete)}) VALUES ({parseValue(line)});\n")

with open("reload.sql", "w", encoding="utf-8") as reload:
    with open("dropAndCreateTable.sql", "r", encoding="utf-8") as dropAndCreate:
        reload.write(dropAndCreate.read())
    with open("request.sql", "r", encoding="utf-8") as request:
        reload.write(request.read())
