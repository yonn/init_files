questions = ( 'Would this action be safe for you (physically and mentally)?',
              'Would this action be safe for others (physically and mentally)?',
	      'Would this action be safe for the environment (physicall and mentall)?',
	      'Would this action be a good investment (physically and mentally)?',
	      'Is this action legal?',
	      'Is it likely that you will stay in controll?',
	      'Do you think that this is a moral thing to do?' )

def moral(k):
	return (((1 / 1225) * (k ** 2)) - ((2 / 175) * k) + (1 / 25))


print('The God algorithm.')
print('------------------')
print('\n\n')

for i, o in enumerate(( 'Absolutely not',
	                'No',
			'Probably not',
			'Probably',
			'Yes',
			'Absolutely Yes' )):
	print('{}: {}'.format(i + 1, o))

print('\n\n')

vs = []

for q in questions:
	print('{} '.format(q), end='')
	vs.append(int(input()))

k = sum(vs)

print('\n\n')

if (k >= 21):
	print('k = {}.\nYou may proceed, the action is morally right.'.format(k))
else:
	print('k = {}\nThe action is morally wrong, do not proceed.'.format(k))

print('\n\n')

print(
'The likelyhood of this action being a good idea is %{0:.2f} (according to moral(k), experimental)'
.format(moral(k) * 100))
