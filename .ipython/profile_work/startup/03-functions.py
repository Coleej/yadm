# spell checker

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

