#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct 18 22:06:19 2020

@author: macbookair13
"""
import random

IMAGENES = ['''
    +---+
    |   |
        |
        |
        |
        |
        =========''', '''
    +---+
    |   |
    O   |
        |
        |
        |
        =========''', '''
    +---+
    |   |
    O   |
   /    |
        |
        |
        =========''', '''
    +---+
    |   |
    O   |
   /|   |
        |
        |
        =========''', '''
    +---+
    |   |
    O   |
   /|\  |
        |
        |
        =========''', '''
    +---+
    |   |
    O   |
   /|\  |
    |   |
        |
        =========''', '''
    +---+
    |   |
    O   |
   /|\  |
    |   |
   /    |
        =========''', '''
    +---+
    |   |
    O   |
   /|\  |
    |   |
   / \  |
        =========''', '''
''']


palabras = ['regex', 'bokeh', 'seaborn', 'matplotlib', 'keras', 'scipy', 'sqlalchemy', 'scrapy', 'pillow', 'beatifulsoup', 'twisted', 'pygame']




def ahorcado ():
    palabra = palabra_random()
    longitud_palabra = ['_']*len(palabra)
    intentos = 0
    
    while True:
       
        pantalla(longitud_palabra,intentos)
        letra_escogida =str(input('Escoge una letra:  '))
        letra_escogida = letra_escogida.lower()

        
        letras_index = []
        for  i in range(len(palabra)):
            if palabra[i] == letra_escogida:
                letras_index.append(i)
        
        if(len(letras_index))==0: # si la lista esta vacia no fue correcto
            intentos += 1
            if intentos== 7:
                pantalla(longitud_palabra,intentos)
                print('')
                print('')
                print('Perdiste, La palabra correcta era {}'.format(palabra))
                break
        else:                       # si la lista tiene algo se cambia el _ por la letra digitada
            for i in letras_index:
                longitud_palabra[i] = letra_escogida

            letras_index =[]

        try:
            longitud_palabra.index('_')
        except ValueError:
            print('')
            print('Felicidades!. La palabra es {}'.format(palabra))
            break
        


def pantalla(longitud_palabra,intentos):
    print(IMAGENES[intentos])
    print('')
    print(longitud_palabra)
    print('---------------------------------------------')



def palabra_random():
    i = random.randint(0, len(palabras)-1)
    return palabras[i]
    
if __name__ == '__main__':
    
    print('BIENVENIDO AL JUEGO DE AHORCADOS, LAS PALABRAS QUE TENDRÁS QUE ADIVINAR SON LIBRERÍAS DE PYTHON, ¡SUERTE!')
    ahorcado()
    