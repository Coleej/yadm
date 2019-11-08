# spell checker

def phi2mm(phi):
    """ convert Wentworth to mm """

    return 2**(-1 * phi)

def mm2phi(mm):
    """ convert Wentworth to mm """

    return -1 * np.log2(mm)

def spell(word):
    """ check spelling a return likely candidates if incorred """

    if word == spellcheck.correction(word):
        print('Correct!')
    else:
        most_likely = spellcheck.correction(word)

        # get feed back
        correct = input(f'is {most_likely.upper()} correct (y/n)?  ')

        if correct != 'y':
            candidates = spellcheck.candidates(word)

            for candidate in candidates:
                print()
                print(candidate)
