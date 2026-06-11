# INDIGE - Plataforma de aprendizaje de idiomas indígenas

#Funciones para aprender cada idioma
def learn_purepecha():
    print("Has seleccionado Purepecha. ¡Vamos a aprender!")
    while True:
        print("¿Qué quieres aprender hoy?")
        print("1. Vocabulario\n2. Gramática\n3. Historias\n4. Volver al menú principal\n")
        opcion = input("Selecciona el número de la opción: ")

        if opcion == "1":
            print("Aquí tienes algunas palabras en Purepecha: ...")
            #import purepecha_vocab 
        elif opcion == "2":
            print("Aquí tienes algunas reglas gramaticales en Purepecha: ...")
            #import purepecha_gramatica
        elif opcion == "3":
            print("Aquí tienes historias sobre la cultura Purepecha: ...")
            #import purepecha_historias
        elif opcion == "4":
            break
        else:
            print("Opción no válida. Por favor, selecciona un número del 1 al 4.")

def learn_nahuatl():
    print("Has seleccionado Nahuatl. ¡Vamos a aprender!")

def learn_maya():
    print("Has seleccionado Maya. ¡Vamos a aprender!")

def learn_otomi():
    print("Has seleccionado Otomi. ¡Vamos a aprender!")


#Inicio del programa
while True:
    print("Bienvenido al INDIGE\n Cual idioma quieres aprender hoy?")
    print("1. Purepecha\n2. Nahuatl\n3. Maya\n4. Otomi\n")
    idioma = input("Selecciona el número del idioma: ")


    if idioma == "1":
        learn_purepecha()

    elif idioma == "2":
        learn_nahuatl()

    elif idioma == "3":
        learn_maya()

    elif idioma == "4":
        learn_otomi()

    else:
        print("Opción no válida. Por favor, selecciona un número del 1 al 5.")
        idioma = input("Selecciona el número del idioma: ")
