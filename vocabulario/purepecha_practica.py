#code para practicar purepecha con preguntas de examen

def purepecha_practica():
    #import random
    import random
    preguntas = {
        "¿Cómo se dice 'hola' en Purepecha?": "jinkoni",
        "¿Cómo se dice 'gracias' en Purepecha?": "sïkuni",
        "¿Cómo se dice 'adiós' en Purepecha?": "jinkoni",
        "¿Cómo se dice 'amigo' en Purepecha?": "tata",
        "¿Cómo se dice 'familia' en Purepecha?": "tata"
    }
    while True:
        pregunta, respuesta = random.choice(list(preguntas.items()))
        print(pregunta)
        user_answer = input("Tu respuesta: ")
        if user_answer.lower() == respuesta:
            print("¡Correcto! ¡Bien hecho!")
        else:
            print(f"Incorrecto. La respuesta correcta es: {respuesta}")
        
        print("¿Quieres intentar otra pregunta? (sí/no)")
        continuar = input("Selecciona tu opción: ")
        if continuar.lower() != "sí":
            print("¡Gracias por practicar Purepecha! ¡Hasta la próxima!")
            break

while True:
    print("Listo?")
    print("1. Sí\n2. No")
    ready = input("Selecciona el número de la opción: ")
    if ready == "1":
        print("¡Vamos a comenzar!")
        break
    elif ready == "2":
        print("Tómate tu tiempo. Avísame cuando estés listo.")
        print("Listo?")
        print("1. Sí\n2. No")
        ready = input("Selecciona el número de la opción: ")
    else:
        print("Opción no válida. Por favor, selecciona un número del 1 al 2.")
        print("Listo?")
        print("1. Sí\n2. No")
        ready = input("Selecciona el número de la opción: ")
