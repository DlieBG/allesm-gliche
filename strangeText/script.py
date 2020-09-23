import random

while True:
    print("Bitte Text eingeben: ")
    text = input()

    words = text.split(" ")

    out = ""

    for word in words:
        if len(word) > 1:
            h = list(word)

            out += h[0]

            h[0] = h[-1]
            del h[-1]

            while len(h)>1:
                r = random.randint(1, len(h)-1)
                out += h[r]
                del h[r]

            out += h[0]
            out += " "
        else:
            out += word + " "

    print(out)
    print("\n")