#!/usr/bin/python
__autor__ = "Fausto Uribe"
archivo = "tmp/Escalon.xyz"
esc = input("Cuantos escalonsitos?\n")
sep = input("Cuanta separacion entre cada uno?\n")
tam = input("Que tan largos?\n")
hancho = 4
pto = [0,0,0]
coor = []
for escalon in range(1,int(esc)+1):
    separacion = int(sep) * (escalon)
    for punto in range(1,int(tam)+1):
        for z in range(1,int(hancho)+1):
            coor.append([punto + separacion, escalon, z])

with open(archivo, mode='w') as afile:
    print(str(len(coor)) + "\n /", file=afile)

with open(archivo, mode='a') as afile:
    for punto in coor:
        print("Au %d %d %d" % (punto[0], punto[1], punto[2]), file=afile)
