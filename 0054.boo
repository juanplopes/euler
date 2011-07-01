import System
import System.Collections.Generic
import System.Linq.Enumerable
import EulerTools from boot

def value(s as string):
	if (s[0] in range(2, 10).Select(Convert.ToString)):
		return int.Parse(s[0])
	if (s[0] == 'T'): return 10
	if (s[0] == 'J'): return 11
	if (s[0] == 'Q'): return 12
	if (s[0] == 'K'): return 13
	if (s[0] == 'A'): return 14
	
def are_same_suit(cards as string*)
	return cards.Select({x|x[1]).Distinct().Count() == 1
	
def is_royal_flush(hand as string*):
	a = hand.Select({x|x[0]).Intersect(('T','J','Q','K','A')).Count() == 5
	return a and are_same_suit(hand)

def is_flush(hand as string*):
	min = hand.Min(value)
	if hand.Select({x|x-min}).Intersect((0,1,2,3,4)).Count() == 5:
		return min
	return 0

def is_straight_flush(hand as string*):
	if not are_same_suit(hand): return 0
	return is_flush(hand)
	
def is_four_of_a_kind(hand as string*):
	value = hand.GroupBy(value).FirstOrDefault({x|x.Count()==4})
	if value != null:
		return value.Key
	return 0

def is_full_house(hand as string*):
	value = hand.GroupBy(value).FirstOrDefault({x|x.Count()==4})
	if value != null:
		return value.Key
	return 0
	
def player1_win(hands as (string)):
	p1 = hands.Take(5).ToArray()
	p2 = hands.Skip(5).Take(5).ToArray()

answer = 0
print answer
assert answer == 1