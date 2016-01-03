#!/usr/bin/python
import math
arabigo = raw_input("Que numero quieres convertir?\n")
total = int(arabigo)
romano = ""

def convertidor( numero ):
    # Divide el numero empezando por mil y se lo resta
    # al numero original.
    futurem = 0
    futurec = 0
    futurex = 0
    backc = []
    backx = []
    backi = []
    romano = ""
    m = math.floor(numero/1000)
    numero -= m*1000
    d = math.floor(numero/500)
    numero -= d*500
    c = math.floor(numero/100)
    numero -= c*100
    l = math.floor(numero/50)
    numero -= l*50
    x = math.floor(numero/10)
    numero -= x*10
    v = math.floor(numero/5)
    numero -= v*5
    i = numero
    # Arregla lo de IIII a IV y asi con todas las posibilidades.
    if c == 4:
        if d == 1:
            d = 0
            c = 1
            m += 1
            futurem = 1
            backc += "m"
        else:
            d = 1
            c = 1
            backc += "d"
    
    if x == 4:
        if l == 1:
            l = 0
            x = 1
            c += 1
            futurec = 1
            backx += "c"
        else:
            l = 1
            x = 1
            backx += "l"
    
    if i == 4:
        if v == 1:
            v = 0
            i = 1
            x += 1
            futurex = 1
            backi += "x"
        else:
            v = 1
            i = 1
            backi += "v"
    
    for a in range(futurem, int(m)):
        romano += "M"
    
    for letra in backc:
        if letra == "m":
            romano += "CM"
            c -= 1
        else:
            romano += "CD"
            c -= 1
            d -= 1
    
    for a in range(0, int(d)):
        romano += "D"
    
    for a in range(futurec, int(c)):
        romano += "C"
    
    for letra in backx:
        if letra == "c":
            romano += "XC"
            x -= 1
        else:
            romano += "XL"
            x -= 1
            l -= 1
    
    for a in range(0, int(l)):
        romano += "L"
    
    for a in range(futurex, int(x)):
        romano += "X"
    
    for letra in backi:
        if letra == "x":
            romano += "IX"
            i -= 1
        else:
            romano += "IV"
            i -= 1
            v -= 1
    
    for a in range(0, int(v)):
        romano += "V"
    
    for a in range(0, int(i)):
        romano += "I"
    
    return romano

mil = math.floor(total/1000)
# Aplica la regla del punto, un punto despues de un numero 
# significa n * 1000
if mil > 3:
    romano += convertidor(mil)
    romano += "."
    total -= mil* 1000

romano += convertidor(total)

print romano
#print "M", m, "D", d, "C", c, "L", l, "X", x, "V", v, "I", i
