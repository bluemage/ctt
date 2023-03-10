#import random
#Can you please take the below code and make it work with the example code using the below code as the main section

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cards = Array()
var scards = PoolStringArray()
var reusedcards = Array()
var discardpile = Array()
var discardpile2 = Array()
var cardspicked = Array()
var actual = Array()
var playerhanddiscard = Array()
var opponenthand = Array()
var opponenthanddiscard = Array()
var cardcount = 0
var handcount = 0
var handcount2 = 0
var showcard = null
var cardn = Array()
var cardc = Array()
var s = Vector2()
var lightpic = preload("res://assets/light.png")
const cardscript = preload("res://cardname.gd")
var backofdeck = preload("res://images/deckback.png")
var inside = false
var selectedcard = null
var playedcard = null
var firstrow = false
var secondrow = false
var cycle = 0
var lastcycle = 0
var lastCardPlayed = 78
var lastCardPlayedmem = null
var lastcard = null
var currentCardPlayed = ""
var trumps = false
var wands = false
var pentacles = false
var cups = false
var swords = false
var valid = false
var wildcard = false
var countme = true
var newGame = true
var history = null
var Opcc = false
var lastsuit = null
var lsuit = "none"
var currentsuit = null
var samesuit = false
var notinhandcount2 = true
var samerank = false
var opponentsamesuit = false
var opponentsamerank = false
var lastcardname = "none"
var playedcardname = "none"
var currentcardplayedname = "none"
var cardcountpluscycle = 0
var cardcountcycle = 0
var cardcounttotal = 0
var oppoenenthandcount = 0
var oppindex = null
var nocards = false
var player = 0
var firstplaythroughdeck = true
var top_card = null
var top_rank = null
var firstturn = true
var player_turn = 0
var player1_cardcount = null
var player_cardcount = null
var player2_cardcount = null
var oppygone = 0
var opponentplayedacard = false
var rand_generate


var deck = []
var discard_pile = []
var players = [1]
var current_player = 0
var current_suit = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	setCards()
	scards = shuffle(cards)
	#print(scards)
	s.x = 0.5
	s.y = 0.5
	#pass # Replace with function body.
	   # randomize seed
	rand_generate = RandomNumberGenerator.new()
	rand_generate.randomize()
	# generate a random integer between 1 and 10

	

func setCards():
	cards.append("00_Fool")
	cards.append("01_Magician")
	cards.append("02_High_Priestess")
	cards.append("03_Empress")
	cards.append("04_Emperor")
	cards.append("05_Hierophant")
	cards.append("06_Lovers")
	cards.append("07_Chariot")
	cards.append("08_Strength")
	cards.append("09_Hermit")
	cards.append("10_Wheel_of_Fortune")
	cards.append("11_Justice")
	cards.append("12_Hanged_Man")
	cards.append("13_Death")
	cards.append("14_Temperance")
	cards.append("15_Devil")
	cards.append("16_Tower")
	cards.append("17_Star")
	cards.append("18_Moon")
	cards.append("19_Sun")
	cards.append("20_Judgement")
	cards.append("21_World")
	cards.append("22_Ace_of_Wands")
	cards.append("23_Two_of_Wands")
	cards.append("24_Three_of_Wands")
	cards.append("25_Four_of_Wands")
	cards.append("26_Five_of_Wands")
	cards.append("27_Six_of_Wands")
	cards.append("28_Seven_of_Wands")
	cards.append("29_Eight_of_Wands")
	cards.append("30_Nine_of_Wands")
	cards.append("31_Ten_of_Wands")
	cards.append("32_Page_of_Wands")
	cards.append("33_Knight_of_Wands")
	cards.append("34_Queen_of_Wands")
	cards.append("35_King_of_Wands")
	cards.append("36_Ace_of_Pentacles")
	cards.append("37_Two_of_Pentacles")
	cards.append("38_Three_of_Pentacles")
	cards.append("39_Four_of_Pentacles")
	cards.append("40_Five_of_Pentacles")
	cards.append("41_Six_of_Pentacles")
	cards.append("42_Seven_of_Pentacles")
	cards.append("43_Eight_of_Pentacles")
	cards.append("44_Nine_of_Pentacles")
	cards.append("45_Ten_of_Pentacles")
	cards.append("46_Page_of_Pentacles")
	cards.append("47_Knight_of_Pentacles")
	cards.append("48_Queen_of_Pentacles")
	cards.append("49_King_of_Pentacles")
	cards.append("50_Ace_of_Cups")
	cards.append("51_Two_of_Cups")
	cards.append("52_Three_of_Cups")
	cards.append("53_Four_of_Cups")
	cards.append("54_Five_of_Cups")
	cards.append("55_Six_of_Cups")
	cards.append("56_Seven_of_Cups")
	cards.append("57_Eight_of_Cups")
	cards.append("58_Nine_of_Cups")
	cards.append("59_Ten_of_Cups")
	cards.append("60_Page_of_Cups")
	cards.append("61_Knight_of_Cups")
	cards.append("62_Queen_of_Cups")
	cards.append("63_King_of_Cups")
	cards.append("64_Ace_of_Swords")
	cards.append("65_Two_of_Swords")
	cards.append("66_Three_of_Swords")
	cards.append("67_Four_of_Swords")
	cards.append("68_Five_of_Swords")
	cards.append("69_Six_of_Swords")
	cards.append("70_Seven_of_Swords")
	cards.append("71_Eight_of_Swords")
	cards.append("72_Nine_of_Swords")
	cards.append("73_Ten_of_Swords")
	cards.append("74_Page_of_Swords")
	cards.append("75_Knight_of_Swords")
	cards.append("76_Queen_of_Swords")
	cards.append("77_King_of_Swords")
	cards.append("78_Back_of_Deck")
	
	actual.append(preload("res://images/deck/00_Fool.png"))
	actual.append(preload("res://images/deck/01_Magician.png"))
	actual.append(preload("res://images/deck/02_High_Priestess.png"))
	actual.append(preload("res://images/deck/03_Empress.png"))
	actual.append(preload("res://images/deck/04_Emperor.png"))
	actual.append(preload("res://images/deck/05_Hierophant.png"))
	actual.append(preload("res://images/deck/06_Lovers.png"))
	actual.append(preload("res://images/deck/07_Chariot.png"))
	actual.append(preload("res://images/deck/08_Strength.png"))
	actual.append(preload("res://images/deck/09_Hermit.png"))
	actual.append(preload("res://images/deck/10_Wheel_of_Fortune.png"))
	actual.append(preload("res://images/deck/11_Justice.png"))
	actual.append(preload("res://images/deck/12_Hanged_Man.png"))
	actual.append(preload("res://images/deck/13_Death.png"))
	actual.append(preload("res://images/deck/14_Temperance.png"))
	actual.append(preload("res://images/deck/15_Devil.png"))
	actual.append(preload("res://images/deck/16_Tower.png"))
	actual.append(preload("res://images/deck/17_Star.png"))
	actual.append(preload("res://images/deck/18_Moon.png"))
	actual.append(preload("res://images/deck/19_Sun.png"))
	actual.append(preload("res://images/deck/20_Judgement.png"))
	actual.append(preload("res://images/deck/21_World.png"))
	actual.append(preload("res://images/deck/22_Ace_of_Wands.png"))
	actual.append(preload("res://images/deck/23_Two_of_Wands.png"))
	actual.append(preload("res://images/deck/24_Three_of_Wands.png"))
	actual.append(preload("res://images/deck/25_Four_of_Wands.png"))
	actual.append(preload("res://images/deck/26_Five_of_Wands.png"))
	actual.append(preload("res://images/deck/27_Six_of_Wands.png"))
	actual.append(preload("res://images/deck/28_Seven_of_Wands.png"))
	actual.append(preload("res://images/deck/29_Eight_of_Wands.png"))
	actual.append(preload("res://images/deck/30_Nine_of_Wands.png"))
	actual.append(preload("res://images/deck/31_Ten_of_Wands.png"))
	actual.append(preload("res://images/deck/32_Page_of_Wands.png"))
	actual.append(preload("res://images/deck/33_Knight_of_Wands.png"))
	actual.append(preload("res://images/deck/34_Queen_of_Wands.png"))
	actual.append(preload("res://images/deck/35_King_of_Wands.png"))
	actual.append(preload("res://images/deck/36_Ace_of_Pentacles.png"))
	actual.append(preload("res://images/deck/37_Two_of_Pentacles.png"))
	actual.append(preload("res://images/deck/38_Three_of_Pentacles.png"))
	actual.append(preload("res://images/deck/39_Four_of_Pentacles.png"))
	actual.append(preload("res://images/deck/40_Five_of_Pentacles.png"))
	actual.append(preload("res://images/deck/41_Six_of_Pentacles.png"))
	actual.append(preload("res://images/deck/42_Seven_of_Pentacles.png"))
	actual.append(preload("res://images/deck/43_Eight_of_Pentacles.png"))
	actual.append(preload("res://images/deck/44_Nine_of_Pentacles.png"))
	actual.append(preload("res://images/deck/45_Ten_of_Pentacles.png"))
	actual.append(preload("res://images/deck/46_Page_of_Pentacles.png"))
	actual.append(preload("res://images/deck/47_Knight_of_Pentacles.png"))
	actual.append(preload("res://images/deck/48_Queen_of_Pentacles.png"))
	actual.append(preload("res://images/deck/49_King_of_Pentacles.png"))
	actual.append(preload("res://images/deck/50_Ace_of_Cups.png"))
	actual.append(preload("res://images/deck/51_Two_of_Cups.png"))
	actual.append(preload("res://images/deck/52_Three_of_Cups.png"))
	actual.append(preload("res://images/deck/53_Four_of_Cups.png"))
	actual.append(preload("res://images/deck/54_Five_of_Cups.png"))
	actual.append(preload("res://images/deck/55_Six_of_Cups.png"))
	actual.append(preload("res://images/deck/56_Seven_of_Cups.png"))
	actual.append(preload("res://images/deck/57_Eight_of_Cups.png"))
	actual.append(preload("res://images/deck/58_Nine_of_Cups.png"))
	actual.append(preload("res://images/deck/59_Ten_of_Cups.png"))
	actual.append(preload("res://images/deck/60_Page_of_Cups.png"))
	actual.append(preload("res://images/deck/61_Knight_of_Cups.png"))
	actual.append(preload("res://images/deck/62_Queen_of_Cups.png"))
	actual.append(preload("res://images/deck/63_King_of_Cups.png"))
	actual.append(preload("res://images/deck/64_Ace_of_Swords.png"))
	actual.append(preload("res://images/deck/65_Two_of_Swords.png"))
	actual.append(preload("res://images/deck/66_Three_of_Swords.png"))
	actual.append(preload("res://images/deck/67_Four_of_Swords.png"))
	actual.append(preload("res://images/deck/68_Five_of_Swords.png"))
	actual.append(preload("res://images/deck/69_Six_of_Swords.png"))
	actual.append(preload("res://images/deck/70_Seven_of_Swords.png"))
	actual.append(preload("res://images/deck/71_Eight_of_Swords.png"))
	actual.append(preload("res://images/deck/72_Nine_of_Swords.png"))
	actual.append(preload("res://images/deck/73_Ten_of_Swords.png"))
	actual.append(preload("res://images/deck/74_Page_of_Swords.png"))
	actual.append(preload("res://images/deck/75_Knight_of_Swords.png"))
	actual.append(preload("res://images/deck/76_Queen_of_Swords.png"))
	actual.append(preload("res://images/deck/77_King_of_Swords.png"))
	actual.append(preload("res://images/deckbackrsize.png"))

func shuffle(cardsy):
		# fisher-yates shuffle: given array with elements 0..n, 
		# for each index i from n down to 1, pick a random index j 
		# and swap elements at i and j.
		
		#var i
		var j
		var tmp
		#i = cardsy.length() - 1
		#for n in range(10,-1,-1):
		#print(n)
		for i in range(cardsy.size() - 1,0,-1):
		#for (i = this.deck.length - 1; i > 0; i--) {
		
			randomize()
			#var rando = randi() % 77
			#j = Math.floor(Math.random() * (i + 1));
			j = floor(randf() * (i + 1));
			tmp = cardsy[i]#this.deck[i];
			cardsy[i] = cardsy[j]
			cardsy[j] = tmp
			#this.deck[i] = this.deck[j];
			#this.deck[j] = tmp;
		return cardsy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	

	if (cardcount == 78 && firstplaythroughdeck):
		firstplaythroughdeck = false
		scards = discardpile.duplicate()
		shuffle(scards)
		cardcount = 0
		discardpile.clear()
	elif (cardcount == len(scards)-1):
		scards = discardpile.duplicate()
		shuffle(scards)
		cardcount = 0
		discardpile.clear()

		s.x = 0.5
		s.y = 0.5
		cycle = cycle + 1

			
	
	if Input.is_action_just_released("mouseleft") && inside == false && cycle == 0:
		##player = next_turn()
		##print("player - is - " + String(player))
		#add to player hand somehow
		lastcard = playedcard
		lastcardname = playedcardname
		player_turn = next_turn()
		
		print("player_turn - is - " + String(player_turn))
		if player_turn == 0:
			if cardcount < len(scards):
				if len(scards[cardcount]) >= 2: #.length() >= 2:
					showcard = scards[cardcount].substr(0,2).to_int()
				else:
					showcard = scards[cardcount].substr(0,1).toinst()
			if cardcount == len(scards):
				print("No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")

			showcard = scards[cardcount].substr(0,2).to_int()#alredy called.
			###print(String(showcard) + " " + scards[cardcount])
			get_node("Sprite").texture = actual[showcard]
			get_node("Label").text = scards[cardcount]
			get_node("Label2").text = String(cardcount)
			get_node("Timer").start()
#			opponentPlayCard()
		
			cardn.append(TextureRect.new())
		#if cycle == 1:
		#	cardcount = cardcount + 78
		#if(cardn != null):
			print(scards.size())
			if cardcounttotal >= 0 and cardcounttotal < scards.size():
#				card = scards[cardcounttotal]
				pass
			else:
				cardcounttotal = cardcounttotal - 1
#			cardcounttotal += 1
			
			if (cardn[cardcounttotal] != null):
				cardn[cardcounttotal].set_script(cardscript)
		###################################################################################################
			var lighter = Light2D.new()
			lighter.hide()
			lighter.set_name("lighter")
			lighter.texture = lightpic
			lighter.position.x = 40
			lighter.position.y = 70
			lighter.scale = s
			
			cardn[cardcounttotal].set_name("card" + String(cardcounttotal))#######################################################maybeuse cardcountcycle here
			cardn[cardcounttotal].cardname = scards[cardcount]########?????????????????????????????????????not sure about cardcount
			cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
			
			cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
			cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")
	
			if handcount < 20:
				if(get_node("HBoxContainer") != null):
					get_node("HBoxContainer").add_child(cardn[cardcounttotal])
				if(get_node("HBoxContainer/card" + String(cardcounttotal)) != null):
					get_node("HBoxContainer/card" + String(cardcounttotal)).add_child(lighter)
				notinhandcount2 = true
				handcount = handcount + 1
				#get_node("HBoxContainer/card" + String(cardcount)).connect("mouse_entered", self, get_node("HBoxContainer/card" + String(cardcount)).entered_mouse())
			elif handcount >= 20 && handcount2 < 20: # && cycle == 0:
				if(get_node("HBoxContainer2") != null):
					get_node("HBoxContainer2").add_child(cardn[cardcounttotal])
				if(get_node("HBoxContainer2/card" + String(cardcounttotal)) != null):
					get_node("HBoxContainer2/card" + String(cardcounttotal)).add_child(lighter)
					notinhandcount2 = false
				handcount2 = handcount2 + 1
			#opponentPlayCard()
#		if firstturn:
#				firstturn = false
#			else:
			lsuit = LCPlayedSuitCheck()
			######################################################################################################################################
			if lsuit:
				get_node("Label9").text = lsuit	
#			#if lsuit != null:
		RegularRankCheck()		
		#if player_turn == 1:		
		Opponent()
#			opponentPlayCard()

		cardcount = cardcount + 1
		cardcounttotal = cardcounttotal + 1
			#countme = false

		
			#string.substr(0,3).to_int()
		# do something
		
	elif Input.is_action_just_released("mouseleft") && inside == false && cycle > 0:  #this is just waiting to break
		lastcard = playedcard
		lastcardname = playedcardname
		player_turn = next_turn()
		if player_turn == 0:
			if cardcount < len(scards):
				if len(scards[cardcount]) >= 2: #.length() >= 2:
					showcard = scards[cardcount].substr(0,2).to_int()
				else:
					showcard = scards[cardcount].substr(0,1).toinst()
				nocards = false
			if cardcount == len(scards):
				print("No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% show deck back at 78")
				nocards = true
				showcard == 78
			#player_turn = next_turn()
		#showcard = scards[cardcount].substr(0,2).to_int()# replace with if else statement
		###print(String(showcard) + " " + scards[cardcount])
		if nocards:
			print("No more cards in deck, wait until cards are played.")
			return#maybe return statement here
		else:
			get_node("Sprite").texture = actual[showcard]
			get_node("Label").text = scards[cardcount]
			get_node("Label2").text = String(cardcount)
			lsuit = lastsuit
			opponentPlayCard() # added this call
			
	
			cardn.append(TextureRect.new())
			if (cardn[cardcounttotal] != null):
				cardn[cardcounttotal].set_script(cardscript)
			###################################################################################################
			var lighter = Light2D.new()
			lighter.hide()
			lighter.set_name("lighter")
			lighter.texture = lightpic
			lighter.position.x = 40
			lighter.position.y = 70
			lighter.scale = s
	
			cardn[cardcounttotal].set_name("card" + String(cardcounttotal))
			cardn[cardcounttotal].cardname = scards[cardcount]   #use resuedcards or discard pile
			cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
			
			cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
			cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")
			
			if handcount < 20:
				if(get_node("HBoxContainer") != null):
					get_node("HBoxContainer").add_child(cardn[cardcounttotal])
				if(get_node("HBoxContainer/card" + String(cardcounttotal)) != null):
					get_node("HBoxContainer/card" + String(cardcounttotal)).add_child(lighter)#get_node("HBoxContainer").add_child(cardn[cardcount])
				handcount = handcount + 1
				notinhandcount2 = true
			elif handcount >= 20 && handcount2 < 20:
				if(get_node("HBoxContainer2") != null):
					#get_node("HBoxContainer2/card" + String(cardcount)).show()
					get_node("HBoxContainer2").add_child(cardn[cardcounttotal])
				if(get_node("HBoxContainer2/card" + String(cardcounttotal)) != null):
					get_node("HBoxContainer2/card" + String(cardcounttotal)).add_child(lighter)

				handcount2 = handcount2 + 1
				notinhandcount2 = false
	
			else:
				pass
		

		cardcount = cardcount + 1
		cardcounttotal = cardcounttotal + 1
				
	if Input.is_action_just_released("mouseleft") && inside && firstrow:
		lastcard = playedcard
		lastcardname = playedcardname

		if has_node("HBoxContainer/" + selectedcard):
			print("played card " + get_node("HBoxContainer/" + selectedcard).cardname)
			playedcard = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
			#playedcardname = 
			playedcardname = get_node("HBoxContainer/" + selectedcard).cardname
			currentCardPlayed = get_node("HBoxContainer/" + selectedcard).cardname.substr(0,2).to_int()
			if currentCardPlayed != null:
				lastCardPlayed = currentCardPlayed

			currentcardplayedname = get_node("HBoxContainer/" + selectedcard).cardname
			get_node("Sprite2").texture = actual[playedcard]
			discardpile.append(get_node("HBoxContainer/" + selectedcard).cardname)
			playerhanddiscard.append((get_node("HBoxContainer/" + selectedcard).cardname))

			print("************** player hand discard ****************")
			print(playerhanddiscard)
			print("^^^^^^^^^^discardpile^^^^^^^^^^^^^^^^^^^^")
			print(discardpile)
			#reusedcards.append(get_node("HBoxContainer/" + selectedcard))
			
			
			get_node("HBoxContainer/" + selectedcard).queue_free()#.hidewasusedhereforatry
			handcount = handcount - 1
			#print(currentCardPlayed)
			#print("there here")#printprintprintprint
			lsuit = LCPlayedSuitCheck()
			if lsuit:
				get_node("Label9").text = lsuit	
			RegularRankCheck()
			Opponent()


			#cardcount = cardcount + 1
			#lastCardPlayed = currentCardPlayed

		
	if Input.is_action_just_released("mouseleft") && inside && secondrow:
		lastcard = playedcard
		lastcardname = playedcardname

		if has_node("HBoxContainer2/" + selectedcard):
			print("played card" + get_node("HBoxContainer2/" + selectedcard).cardname)
			playedcard = get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int()
			playedcardname = get_node("HBoxContainer2/" + selectedcard).cardname
			
			currentCardPlayed = get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int()
			if currentCardPlayed != null:
				lastCardPlayed = currentCardPlayed

			currentcardplayedname = get_node("HBoxContainer2/" + selectedcard).cardname
			get_node("Sprite2").texture = actual[playedcard]
			###print(get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int())
			discardpile.append(get_node("HBoxContainer2/" + selectedcard).cardname)
			#discardpile2.append(get_node("HBoxContainer2/" + selectedcard))
			playerhanddiscard.append((get_node("HBoxContainer2/" + selectedcard).cardname))
			print("************** player hand discard ****************")
			print(playerhanddiscard)#maybe should be different variable name since this is selected card something or other start here !!!!!!!!!!!!!!!!!!!!!!!!!!
			print("^^^^^^^^^^discardpile^^^^^^^^^^^^^^^^^^^^")
			print(discardpile)
#			reusedcards.append(get_node("HBoxContainer2/" + selectedcard))
			get_node("HBoxContainer2/" + selectedcard).queue_free()
			handcount2 = handcount2 - 1
			#print(currentCardPlayed)
			print("there there")	
			lsuit = LCPlayedSuitCheck()
			if lsuit:
				get_node("Label9").text = lsuit
				#if lsuit != null:
			RegularRankCheck()				
			Opponent()


		#cardcount = cardcount + 1
			#pass
		#lastCardPlayed = currentCardPlayed

	
func next_turn() -> int:
	if(current_player == 1):
		current_player = 0
		return current_player
	else:
		current_player = 1
		return current_player


#func LCPlayedStart(currentCardPlayed):
#	lastCardPlayed = currentCardPlayed
	
func LCPlayedSuitCheck() -> String:
	print(currentCardPlayed)
	print("thats that")
	
	if len(discardpile) == 0:
		return ""

	lastCardPlayed = discardpile[len(discardpile) - 1]
	currentCardPlayed = lastCardPlayed
	print(len(discardpile))
	#lastCardPlayedmem = lastCardPlayed
	#lastCardPlayed = currentCardPlayed	
	#############################################
	
	#showcard = scards[playedcard].substr(0,2).to_int()
	#showcard = scards[currentCardPlayed].substr(0,2).to_int()
	#showcard = currentCardPlay
	if currentCardPlayed:
		#currentCardPlayed = currentCardPlayed.substr(0,2).to_int()
		print(String(currentCardPlayed) + " yoyoyoyoyoyoyoyoy")
		print(len(scards)-1)
		print(currentCardPlayed)
		if (int((currentCardPlayed)) >= (len(scards)-1)):#################:
			print("Error: currentCardPlayed is out of bounds")
			return ""
		print(String(currentCardPlayed) )
		print(scards[int(currentCardPlayed)])
		print("+++++")
		if (int((currentCardPlayed)) <= 21):
			trumps = true
			print("trumps")
			wands = false
			pentacles = false
			cups = false
			swords = false
			currentsuit = "trumps"
			get_node("Label9").text = "trumps"
			print("so I guess pickSuit")
			pickSuit()
			get_node("Label9").text = lastsuit
		if (int((currentCardPlayed)) > 21 && (int(currentCardPlayed)) <= 35):
			wands = true
			print("wands")
			trumps = false
			pentacles = false
			cups = false
			swords = false
			currentsuit = "wands"
			get_node("Label9").text = "wands"
		if (int((currentCardPlayed)) > 35 && (int(currentCardPlayed)) <= 49):
			pentacles = true
			print("pentacles")
			trumps = false
			wands = false
			cups = false
			swords = false
			currentsuit = "pentacles"
			get_node("Label9").text = "pentacles"
		if(int((currentCardPlayed)) > 49 && int((currentCardPlayed)) <= 63):
			cups = true
			print("cups")
			trumps = false
			wands = false
			pentacles = false
			swords = false
			currentsuit = "cups"
			get_node("Label9").text = "cups"
		if(int((currentCardPlayed)) > 63 && int((currentCardPlayed)) <= 77):
			swords = true
			print("swords")
			trumps = false
			wands = false
			pentacles = false
			cups = false
			currentsuit = "swords"
			get_node("Label9").text = "swords"
		if(int(currentCardPlayed) == 78):
			get_node("Label9").text = "deckback"
			currentsuit = "none this is the deckback"
		print("currentsuit is ------> " + currentsuit)
		if lastsuit == null:
			lastsuit = currentsuit
		if lastsuit != null:
			if lastsuit == currentsuit:
				samesuit = true
				print("the suit is the same condition ::true::")
			else:
				samesuit = false
				print("the suit is not the same ::false::")
			lastsuit = currentsuit	
	
		#lastCardPlayed = currentCardPlayed
	return lastsuit
	

		
func RegularRankCheck():
	
#	print(currentCardPlayed)
#	print("thats that")
#	#lastCardPlayedmem = lastCardPlayed
#	#lastCardPlayed = currentCardPlayed	
#	#############################################
#	
#	#showcard = scards[playedcard].substr(0,2).to_int()
#	#showcard = scards[currentCardPlayed].substr(0,2).to_int()
#	#showcard = currentCardPlayed
#	print(String(currentCardPlayed) + " " + scards[currentCardPlayed] + "+++++")

##############################################
##This section of logic needs scrutiny      ##
## 											##
##											##
##											##
##############################################

	if(currentCardPlayed):
		if(lastcard):
			if (int(currentCardPlayed) <= 21 && lastcard <= 21):
				#TrumpRank() depricated using a function for one if statement seems too much
				#do trump rank here
				if (int(currentCardPlayed) > lastcard):
					pickSuit()
					#currentsuit = "trumps"
					print(" - ranking just occured - current card greater than last card")
					print(currentsuit)
				get_node("Label9").text = lsuit #current_suit
			if(int(currentCardPlayed) > 21 && lastcard > 21):
				if (currentcardplayedname.substr(3,4) == lastcardname.substr(3,4)):
					samerank = true
					print("This is the current and last card rank match" + currentcardplayedname + " ------last-card-name------>>>" + lastcardname)
					print(currentcardplayedname.substr(3,4) + " ------  " + lastcardname.substr(3,4))
		else:
			if (int(currentCardPlayed) <= 21):
				pickSuit()
	#pass
	
func TrumpRank():
	print("do trump rank here")
	#if(currentCardPlayed):
	#	if(lastcard <= 21):
	if (currentCardPlayed > lastcard):
		pickSuit()
	#pass
	
		
func Opponent():
#
#	playedcard = scards[cardcount].substr(0,2).to_int()
#	#get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int()
#	playedcardname = scards[cardcount]
#	print("testbed area areaarea areaarea areaarea areaarea areaarea areaarea areaarea areaarea area" + scards[cardcount])
#	#get_node("HBoxContainer2/" + selectedcard).cardname
#	#trying some elifs instead of just ifs
##forreference add in later				discardpile.append(get_node("HBoxContainer/" + selectedcard).cardname)

#	print("opponent:")
	print("opponent:")
	if cardcount < scards.size():
		if scards[cardcount] != null:
			var card = scards[cardcount]
			if card.substr(0,2).to_int() > 0:
				showcard = card.substr(0,2).to_int()
				playedcard = showcard
				playedcardname = card
			else:
				showcard = card.substr(0,1).to_int()
				playedcard = showcard
				playedcardname = card
			nocards = false


#	if cardcount < scards.size():
#		if scards[cardcount] != null:
#			var card = scards[cardcount]
#			var len_of_card = card.size()
#			if len_of_card >= 2:
#				showcard = card.substr(0,2).to_int()
#			else:
#				showcard = card.substr(0,1).to_int()
#			nocards = false
#			playedcard = card.substr(0,2).to_int()
#			playedcardname = card

#	if cardcount < scards.size():
#		if scards[cardcount] != null:
#			var card = scards[cardcount]
#			card = int(card)
#			var len_of_card = card.length()
#			if len_of_card >= 2:
#				showcard = card.substr(0,2).to_int()
#			else:
#				showcard = card.substr(0,1).to_int()
#			nocards = false
#			playedcard = card.substr(0,2).to_int()
			playedcardname = card
#	if cardcount < scards.size():
#		if scards[cardcount] != null:
#			var card = scards[cardcount]
#			var len_of_card = card.length()
#			if len_of_card >= 2:
#				showcard = card.substr(0,2).to_int()
#			else:
#				showcard = card.substr(0,1).to_int()
#			nocards = false
#			playedcard = card.substr(0,2).to_int()
#			playedcardname = card
#
#	if cardcount < scards.size():
#		if scards[cardcount] != null:
#			if scards[cardount].size () >= 2:
##			var xcards = scards[cardcount]
##			#maybe change variables a bit 
##			#var len_of_card = xcards
##			var xcardsn = xcards.to_int()
##			if xcardsn.size() >= 2: #.length() >= 2:
##				showcard = xcards.substr(0,2).to_int()
##			else:
##				showcard = xcards.substr(0,1).toint()
#			nocards = false
#			playedcard = xcards.substr(0,2).to_int()
#	#get_node("HBoxContainer2/" + selectedcard).cardname.substr(0,2).to_int()
#			playedcardname = xcards
			print("testbed area areaarea areaarea areaarea areaarea areaarea areaarea areaarea areaarea area" + scards[cardcount])
		

	nocards = true
	for card in scards:
		if card != null:
			var areyouseriouslen = card.substr(0,2)
			#areyouseriouslen = int(areyouseriouslen)
			var converted_int = areyouseriouslen.to_int()
			#if areyouseriouslen.is_number():
			if converted_int != 0:
				showcard = converted_int
				nocards = false
				break
			
#
#
#			is_number():
#			#is_digit():
#				showcard = int(areyouseriouslen.substr(0,2))
#			#	areyouseriouslen = areyouseriouslen.to_int() 
#				nocards = false
#				break
#			elif (card.substr(0,1).is_number()):
#			#areyouseriouslen.isdigit()):				
##			if (len(card) >= 2):
#				showcard = int(card.substr(0,1)) #int(card[:2])
#				nocards = false
#			else:
#				pass	#				break
#			elif card[0].isdigit():
#				showcard = int(card.substr(0,1)) 
			playedcard = int(card.substr(0,2))
			playedcardname = card
#
#			nocards = false
#			playedcard = int(card.substr(0,2))#[:2])
#			playedcardname = card
			print("Testbed area areaarea areaarea areaarea areaarea areaarea areaarea areaarea areaarea area" + card)
			break
		if cardcount == (scards[cardcount].substr(0,2).isdigit()):
#		elif cardcount == scards.substr(0,2).isdigit():
			print("No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%No cards currently available%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
			nocards = true
			showcard == 78#maybe not showcard 78 here
	if nocards:
		print("No more cards in deck, wait until cards are played. Opponent Turn.")
	#	get_node("Timer").start()#maybe maybe maybe maybe 
	#	opponentPlayCard()f
		#opponentPlayCard()
		return
	else:
	#showcard = scards[cardcount].substr(0,2).to_int()# replace with above code
	#print(String(showcard) + " - " + scards[cardcount])
	#lastcardname = scards[lastcard]#removinglasCardPlayed for showcard
	#playcard placeholder
		if(player_turn == 1):
			if (lastcard != null):
				get_node("Sprite3").texture = actual[lastcard]#showcard]
			discardpile.append(lastcard)##########################################maybe this needs uncommented not sure
		#	get_node("Label3").text = lastcardname# scards[cardcount]#######################################################################################################
			get_node("Label3").text = ("blah" + playedcardname)#scards[lastCardPlayed]# scards[cardcount]#######################################################################################################
			get_node("Label4").text = String(cardcount)
			
			#get card for opponent
			#showcard = scards[cardcount].substr(0,2).to_int()#already called
			print(String(showcard) + " " + scards[cardcount])
			##########get_node("Sprite").texture = actual[showcard]
			get_node("Label").text = scards[cardcount]
			get_node("Label2").text = String(cardcount)
			#cardcount  = cardcount + 1
		#countme = false
		#pass
		#showcard = scards[cardcount].substr(0,2).to_int()#aleady called
		###print(String(showcard) + " " + scards[cardcount])
			get_node("Sprite4").texture = actual[showcard]
			get_node("Label5").text = scards[cardcount]
			get_node("Label6").text = String(cardcounttotal)
			var opponentmsg = "Your Oppenent Took a Card -" + scards[cardcount]
			get_node("Label7").text = opponentmsg
		#get_node("Sprite4").texture = actual[showcard]
			cardn.append(TextureRect.new())
			if (cardn[cardcounttotal] != null):
				cardn[cardcounttotal].set_script(cardscript)
		###################################################################################################
			var lighter = Light2D.new()
			lighter.hide()
			lighter.set_name("lighter")
			lighter.texture = lightpic
			lighter.position.x = 40
			lighter.position.y = 70
			lighter.scale = s
	
			cardn[cardcounttotal].set_name("card" + String(cardcounttotal))#######################################################maybeuse cardcountcycle here
			cardn[cardcounttotal].cardname = scards[cardcount]
			
			
			cardn[cardcounttotal].add_child(lighter)
			cardn[cardcounttotal].add_child(Sprite.new())
			cardn[cardcounttotal].get_child(0).set_texture(actual[showcard])
			cardn[cardcounttotal].get_child(0).set_scale(Vector2(0.16, 0.16))
			cardn[cardcounttotal].get_child(0).set_position(Vector2(0,0))
			
			
			
			
			
			cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
			
#maybe not take these out not sure	
#		cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
#		cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")
	
			opponenthand.append(scards[cardcount])
			print("----------------------opponent-hand----------------------")
			print(opponenthand)
			print("----------------------opponent-hand-end------------------")
			print(playerhanddiscard)
#			cardcount = cardcount + 1
#			cardcounttotal = cardcounttotal + 1
		#if(player_turn == 1):
			get_node("Timer").start()
			get_node("Sprite4/Light2D").show()
		#timer callso opponentPlayCard()
	
func opponentPlayCard():
	oppygone = 0#maybe not needed
	print("the opphand   ")

	#for o in opponenthand:
	#	print("opponent hand is " + o)
	var indexi = 0	
	print("*******************************************look here for index, opponenthand[index]********************************")	
	#for index in range(len(opponenthand)-1):
	for ophand in opponenthand:
		oppindex = ophand.substr(0,2).to_int()

		while indexi < len(opponenthand):
			print(indexi, opponenthand[indexi])
			print("discarding discarding discarding discarding ===")
			print(discardpile)
			print(len(discardpile)-1)
			print(top_rank)
			if discardpile != null:
				top_card = discardpile[len(discardpile)-1]#maybe needs a minus one removed it for now
				if top_rank:
					top_rank = top_card.substr(0,2).to_int()			
			#lastsuit = LCPlayedSuitCheck()
					currentCardPlayed = top_rank
					
					#not sure about this remove statement
			if(ophand.substr(0,2) == opponenthand[indexi].substr(0,2)):
				opponenthand.remove(indexi)
			else:
				indexi += 1	

#		lastsuit = "none"
#		#this is new section
#		if top_card:
#			if discardpile:
#				top_card = discardpile[discardpile.size() - 1]
#				top_rank = top_card.substr(0,2).to_int()			
		currentCardPlayed = top_rank
		RegularRankCheck()
#		#Check suit
#				lastsuit = LCPlayedSuitCheck()
		
		if oppindex <= 21:
			#play the card
			print("I should play my TRUMP card!!!")
			get_node("Sprite2").texture = actual[oppindex]
			get_node("Label3").text = ophand#playedcardname#scards[cardcount]
			get_node("Label4").text = String(cardcount)
			discardpile.append(ophand)	
			
			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
			for index in range(len(opponenthand)-1):
				print(index, opponenthand[index])
				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
					opponenthand.remove(index)#opponenthand[index]
			opponentplayedacard = true
			lastsuit = LCPlayedSuitCheck()
			pickSuit()
			#lsuit = LCPlayedSuitCheck()
			#lsuit = LCPlayedSuitCheck()
			if lastsuit:
				get_node("Label9").text = lastsuit	
				print(lastsuit)
				print(" lsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuit--------------------" + lastsuit)
			break
			
			if(oppindex > 21 && oppindex < 78):
				if (ophand.substr(3,4) == lastcardname.substr(3,4)):
					print("opponent play card for rank" + String(oppindex) + "  -- for card" + lastcardname + " and " + ophand)
					opponentsamerank = true
					get_node("Sprite2").texture = actual[oppindex]
					get_node("Label3").text = ophand#lastcardname#playedcardname#scards[cardcount]
					get_node("Label4").text = String(cardcount)
					discardpile.append(ophand)		
					print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
					for index in range(len(opponenthand)-1):
						print(index, opponenthand[index])
						if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
							opponenthand.remove(index)#opponenthand[index]
				lastsuit = LCPlayedSuitCheck()
				opponentplayedacard = true
		
		
		
		
		if (oppindex > 21 && oppindex <= 35 && lastsuit == "wands"):
			print("opponent play card for wands" + String(oppindex))
			opponentsamesuit = true
			#play the card
			get_node("Sprite2").texture = actual[oppindex]
			get_node("Label3").text = ophand#playedcardname# scards[cardcount]
			get_node("Label4").text = String(cardcount)
			discardpile.append(ophand)		
			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
			for index in range(len(opponenthand)-1):
				print(index, opponenthand[index])
				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
					opponenthand.remove(index)#opponenthand[index]
			opponentplayedacard = true
		#	lastsuit = LCPlayedSuitCheck()
			lastsuit= "wands"
			break
		elif(oppindex > 35 && oppindex <= 49 && lastsuit == "pentacles"):
			print("opponent play card for pentacles" + String(oppindex))
			opponentsamesuit = true
			get_node("Sprite2").texture = actual[oppindex]
			get_node("Label3").text = ophand#playedcardname# scards[cardcount]
			get_node("Label4").text = String(cardcount)
			discardpile.append(ophand)			
			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
			for index in range(len(opponenthand)-1):
				print(index, opponenthand[index])
				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
					opponenthand.remove(index)#opponenthand[index]
			#lastsuit = LCPlayedSuitCheck()
			opponentplayedacard = true
			lastsuit = "pentacles"
			break
			
		elif (oppindex > 49 && oppindex <= 63 && lastsuit == "cups"):
			print("opponent play card for cups" + String(oppindex))
			opponentsamesuit = true	
			get_node("Sprite2").texture = actual[oppindex]
			get_node("Label3").text = ophand#playedcardname# scards[cardcount]
			get_node("Label4").text = String(cardcount)
			discardpile.append(ophand)
			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
			for index in range(len(opponenthand)-1):
				print(index, opponenthand[index])
				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
					opponenthand.remove(index)#opponenthand[index]
			#lsuit = LCPlayedSuitCheck()
			lastsuit = "cups"
			opponentplayedacard = true
			break
			#play the card
			#pass
		elif (oppindex > 63 && oppindex <= 77 && lastsuit =="swords"):	
			print("opponent play card for swords" + String(oppindex))
			opponentsamesuit = true
			get_node("Sprite2").texture = actual[oppindex]
			get_node("Label3").text = ophand#playedcardname# scards[cardcount]
			get_node("Label4").text = String(cardcount)
			discardpile.append(ophand)			
			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
			for index in range(len(opponenthand)-1):
				print(index, opponenthand[index])
				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
					opponenthand.remove(index)#opponenthand[index]
			lastsuit = "swords"
			#lsuit = LCPlayedSuitCheck()
			opponentplayedacard = true
			break
		elif(oppindex == 78):
			#currentsuit = "none this is the deckback"
			#print("currentsuit is ------> " + currentsuit)
			print("deckback")
#		print(lastsuit)
		print("= lastsuit")
		#lsuit = LCPlayedSuitCheck()
		if lastsuit:
			get_node("Label9").text = lastsuit	
			print(lastsuit)
			print("now current suit lsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuit" + lastsuit)
		#	lsuit = lastsuit
#		lsuit = LCPlayedSuitCheck()
#		if lsuit:
#			get_node("Label9").text = lsuit	
#			print(lsuit)
#			print(" lsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuit")
#
			
		if opponentplayedacard == true:
			opponentplayedacard = false
			#check rank

			#break	
		#check trump					
#		if oppindex <= 21:
#			#play the card
#			print("I should play my TRUMP card!!!")
#			get_node("Sprite2").texture = actual[oppindex]
#			get_node("Label3").text = ophand#playedcardname#scards[cardcount]
#			get_node("Label4").text = String(cardcount)
#			discardpile.append(ophand)	
#			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#			for index in range(len(opponenthand)-1):
#				print(index, opponenthand[index])
#				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#					opponenthand.remove(index)#opponenthand[index]
#			break


#		if lastsuit == null:
#			lastsuit = currentsuit
#		if lastsuit != null:
#			if lastsuit == currentsuit:
#				samesuit = true
#				print("the suit is the same condition ::true::")
#			else:
#				samesuit = false
#				print("the suit is not the same ::false::")
#		lastsuit = currentsuit	
	
			lastCardPlayed = currentCardPlayed
		
		
			#break
			
	oppygone = oppygone + 1
#			if(opponentsamesuit || opponentsamerank):
#				break
	for o in opponenthand:
		print("new opponent hand is " + o)
		
#	lsuit = LCPlayedSuitCheck()
#	if lsuit:
#		get_node("Label9").text = lsuit	
#		print(lsuit)
#		print(" lsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuit")
	#player_turn = next_turn()				
		
		# not sure if this is correct.
#	if discardpile:
#		top_card = discardpile[discardpile.size()-1]
#		top_rank = top_card.substr(0,2).to_int()
#
#		# check if any card in the opponent's hand has the same rank as the top card
#		for card in opponenthand:
#			var rank = card.substr(0,2).to_int()
#			if rank == top_rank:
#				opponenthand.erase(card)
#				discardpile.append(card)
#				return card
#
#		# if no card with the same rank, play the first card in the opponent's hand
#		var played_card = opponenthand[0]
#		opponenthand.erase(played_card)
#		discardpile.append(played_card)
#		return played_card

		#lsuit = LCPlayedSuitCheck()
			#if lsuit != null:
	#RegularRankCheck()	
				
		
func opponentPlayCardOriginal():
	##if (player == 1):
	#discardpile.append(get_node("HBoxContainer2/" + selectedcard).cardname)
	
	#if trump available play card
	#if same suit and same rank available randomize play between the two
	#if same rank play card
	#if same suit play card
	#othewise pick a card I guess or skip maybe?
	#add card to discadpile array
	#free card in array
	var oppygone = 0
	print("the opphand   ")
	#lcn = lastcardname.substr(0,2).to_int()
	for o in opponenthand:
		print("opponent hand is " + o)
	
	#for index, o in enumerate(opponenthand):
	#	print("opponent hand is " + o + " and the index is=" + String(index))
	#for index, item in enumerate(items):
		#	print(index, item)
	print("*******************************************look here for index, opponenthand[index]********************************")	
	for index in range(len(opponenthand)):
		print(index, opponenthand[index])
			
			
#			for index in range(len(items)):
#    print(index, items[index])
			
	for ophand in opponenthand:
		#checksuit
		oppindex = ophand.substr(0,2).to_int()
				#checkrank

			
		if(oppindex > 21 && oppindex < 78):
			if (ophand.substr(3,4) == lastcardname.substr(3,4)):
				print("opponent play card for rank" + String(oppindex) + "  -- for card" + lastcardname + " and " + ophand)
				opponentsamerank = true
				get_node("Sprite2").texture = actual[oppindex]
				get_node("Label3").text = ophand#lastcardname#playedcardname#scards[cardcount]
				get_node("Label4").text = String(cardcount)
				discardpile.append(ophand)		
				#remove_card(opponenthand, oppygone)	
				#opponenthand.remove(ophand)
				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
				for index in range(len(opponenthand)):
					print(index, opponenthand[index])
					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
						opponenthand.remove(ophand)#opponenthand[index]
				opponentplayedacard = true
				#break	
						
#					for opped in opponenthand:
#						if (oppindex == opped.substr(0,2).to_int()):
#
#							opponenthand.remove(opped)
#							print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)
					#next_turn()
					#break
					#play card of same rank
					#pass
					
		if oppindex <= 21:
			#play the card
			print("I should play my TRUMP card!!!")
			get_node("Sprite2").texture = actual[oppindex]
			get_node("Label3").text = ophand#playedcardname#scards[cardcount]
			get_node("Label4").text = String(cardcount)
			discardpile.append(ophand)	
				#remove_card(opponenthand, oppygone)	
				#opponenthand.remove(ophand)	
#				for opped in opponenthand:
#					if (oppindex == opped.substr(0,2).to_int()):
#						opponenthand.remove(opped)
#						print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)

			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
			for index in range(len(opponenthand)):
				print(index, opponenthand[index])
				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
					opponenthand.remove(ophand)#opponenthand[index]
			break
				#next_turn()	
				###break				#maybeneed to break here
#			if oppindex <= 21:
#				#play the card
#				print("I should play my TRUMP card!!!")
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = playedcardname#scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)	
#				opponenthand.remove(oppygone)	
#				next_turn()	
#				break
		if (oppindex > 21 && oppindex <= 35 && lastsuit == "wands"):
			print("opponent play card for wands" + String(oppindex))
			opponentsamesuit = true
				#play the card
			get_node("Sprite2").texture = actual[oppindex]
			get_node("Label3").text = ophand#playedcardname# scards[cardcount]
			get_node("Label4").text = String(cardcount)
			discardpile.append(ophand)			
				#remove_card(opponenthand, oppygone)
#				opponenthand.remove(ophand)
			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
			for index in range(len(opponenthand)):
				print(index, opponenthand[index])
				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
					opponenthand.remove(ophand)#opponenthand[index]
					
#				for opped in opponenthand:
#					if (oppindex == opped.substr(0,2).to_int()):
#						opponenthand.remove(opped)
#						print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)
				#next_turn()
			break
				#pass
		if(oppindex > 35 && oppindex <= 49 && lastsuit == "pentacles"):
			print("opponent play card for pentacles" + String(oppindex))
			opponentsamesuit = true
			get_node("Sprite2").texture = actual[oppindex]
			get_node("Label3").text = ophand#playedcardname# scards[cardcount]
			get_node("Label4").text = String(cardcount)
			discardpile.append(ophand)			
			#remove_card(opponenthand, oppygone)
			opponenthand.remove(ophand)
			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
			for index in range(len(opponenthand)):
				print(index, opponenthand[index])
				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
					opponenthand.remove(ophand)#opponenthand[index]
#				for opped in opponenthand:
#					if (oppindex == opped.substr(0,2).to_int()):
#						opponenthand.remove(opped)
#						print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)
#				#next_turn()
			break
				#play the card
				#pass
				
		if (oppindex > 49 && oppindex <= 63 && lastsuit == "cups"):
			print("opponent play card for cups" + String(oppindex))
			opponentsamesuit = true	
			get_node("Sprite2").texture = actual[oppindex]
			get_node("Label3").text = ophand#playedcardname# scards[cardcount]
			get_node("Label4").text = String(cardcount)
			discardpile.append(ophand)
			#remove_card(opponenthand, oppygone)
#			opponenthand.remove(ophand)
			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
			for index in range(len(opponenthand)):
				print(index, opponenthand[index])
				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
					opponenthand.remove(ophand)#opponenthand[index]
#				for opped in opponenthand:
#					if (oppindex == opped.substr(0,2).to_int()):
#						opponenthand.remove(opped)
#						print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)
#				#next_turn()
			break
				#play the card
				#pass
		if (oppindex > 63 && oppindex <= 77 && lastsuit =="swords"):	
			print("opponent play card for swords" + String(oppindex))
			opponentsamesuit = true
			get_node("Sprite2").texture = actual[oppindex]
			get_node("Label3").text = ophand#playedcardname# scards[cardcount]
			get_node("Label4").text = String(cardcount)
			discardpile.append(ophand)			
			#remove_card(opponenthand, oppygone)
#			opponenthand.remove(ophand)
			print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
			for index in range(len(opponenthand)):
				print(index, opponenthand[index])
				if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
					opponenthand.remove(ophand)#opponenthand[index]
#				for opped in opponenthand:
#					if (oppindex == opped.substr(0,2).to_int()):
#						opponenthand.remove(opped)
#						print("===========================removed)))))))))))))))))((((((((((((((((( ==" + opped)
				#next_turn()
			break
				#play the card
				#pass
			#else:
		if(oppindex == 78):
			#currentsuit = "none this is the deckback"
			#print("currentsuit is ------> " + currentsuit)
			print("deckback")
			
#			if(opponentsamesuit == true || opponentsamerank == true):
#				print(String(oppindex) + "-oppindex-" + ophand)
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)			
#				opponenthand.remove(oppindex)
#				break
			#maybe play card at end of function
			
		oppygone = oppygone + 1
		if(opponentsamesuit || opponentsamerank):
			break
	for o in opponenthand:
		print("new opponent hand is " + o)
	#player_turn = next_turn()				
				
		
		
		
#		showcard = scards[cardcount].substr(0,2).to_int()
#		###print(String(showcard) + " " + scards[cardcount])
#		get_node("Sprite").texture = actual[showcard]
#		get_node("Label").text = scards[cardcount]
#		get_node("Label2").text = String(cardcount)
		
#		cardn.append(TextureRect.new())
#		#if cycle == 1:
#		#	cardcount = cardcount + 78
#		#if(cardn != null):
#		if (cardn[cardcounttotal] != null):
#			cardn[cardcounttotal].set_script(cardscript)
#		###################################################################################################
#		var lighter = Light2D.new()
#		lighter.hide()
#		lighter.set_name("lighter")
#		lighter.texture = lightpic
#		lighter.position.x = 40
#		lighter.position.y = 70
#		lighter.scale = s
#		#cardc.append(Control.new())
#		cardn[cardcounttotal].set_name("card" + String(cardcounttotal))#######################################################maybeuse cardcountcycle here
#		
#		#scards discard resued logic is needed
#		cardn[cardcounttotal].cardname = scards[cardcount]########?????????????????????????????????????not sure about cardcount
#		#cardc[cardcount].set_name("cardc" + String(cardcount))
#		#cardn[cardcount].texture = actual[showcard] #
#		cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
#		
#
#		cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
#		cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")


#		if handcount < 20:
#			if(get_node("HBoxContainer") != null):
#				get_node("HBoxContainer").add_child(cardn[cardcounttotal])
#			if(get_node("HBoxContainer/card" + String(cardcounttotal)) != null):
#				get_node("HBoxContainer/card" + String(cardcounttotal)).add_child(lighter)
#			notinhandcount2 = true
#			handcount = handcount + 1
#			#get_node("HBoxContainer/card" + String(cardcount)).connect("mouse_entered", self, get_node("HBoxContainer/card" + String(cardcount)).entered_mouse())
#		elif handcount >= 20 && handcount2 < 20: # && cycle == 0:
#			if(get_node("HBoxContainer2") != null):
#				get_node("HBoxContainer2").add_child(cardn[cardcounttotal])
#			if(get_node("HBoxContainer2/card" + String(cardcounttotal)) != null):
#				get_node("HBoxContainer2/card" + String(cardcounttotal)).add_child(lighter)
#				notinhandcount2 = false
#			handcount2 = handcount2 + 1


#		cardcount = cardcount + 1
#		cardcounttotal = cardcounttotal + 1



#		if (oppindex > 21 && oppindex <= 35 && lastsuit == "wands" && opponentsamerank == true):
#			#randomly select either
#			#play the card
#			pass
#		if (oppindex > 35 && oppindex <= 49 && lastsuit == "pentacles" && opponentsamerank == true):
#			#play the card
#			pass
#		if (oppindex > 49 && oppindex <= 63 && lastsuit == "cups" && opponentsamerank == true):
#				#play the card
#			pass
#		if (oppindex > 63 && oppindex <= 77 && lastsuit =="swords" && opponentsamerank == true):	
#			#play the card
#			pass
				
#		if ophand.substr(3,4):
#			#pass
#			var oppy = ophand.substr(3,4)
#			print("THE SUBSTRING FOR OPPONENTS HAND IS---" + oppy)
#			if lastcardname.substr
			#pass

#		if(lastcard):
#
#	if(currentCardPlayed):
#		if(lastcard):
#			if (currentCardPlayed <= 21 && lastcard <= 21):
#				#TrumpRank() depricated using a function for one if statement seems too much
#				#do trump rank here
#				if (currentCardPlayed > lastcard):
#					pickSuit()
#					currentsuit = "trumps - ranking just occured - current card greater than last card"
#					print(currentsuit)
#			if(currentCardPlayed > 21 && lastcard > 21):
#				if (currentcardplayedname.substr(3,4) == lastcardname.substr(3,4)):
#					samerank = true
#					print("This is the current and last card rank match" + currentcardplayedname + " ------last-card-name------>>>" + lastcardname)
#					print(currentcardplayedname.substr(3,4) + " ------  " + lastcardname.substr(3,4))
#		else:
#			if (currentCardPlayed <= 21):
#				pickSuit()
	#pass
	
#func remove_card(opponent, card):
	
func remove_card(opponent, card):
	if card in opponent:
		opponent.remove(card)
		opponenthanddiscard.append(card)
	else:
		if card in opponenthanddiscard:
			print("Opponent has already removed this card.")
		else:
			print("Card not found in opponent's hand or removed cards.")
			
#func remove_card(opponent, card):
#	if card in opponent.hand:
#		opponent.hand.remove(card)
#		opponent.removed_cards.append(card)
#	else:
#		if card in opponent.removed_cards:
#			print("Opponent has already removed this card.")
#		else:
#			print("Card not found in opponent's hand or removed cards.")
#
#func remove_card(opponent, card):
#	for card in opponent:
#		if card not in opponenthanddiscard:
#			opponent.remove(card)
#			opponenthandiscard.append(card)
#		else:
#			print("Opponent has already removed this card.")
#
##
##func remove_card(opponent, card):
##	if card not in opponent.removed_cards:
##		opponent.hand.remove(card)
##		opponent.removed_cards.append(card)
##	else:
##		print("Opponent has already removed this card.")
		
func playerpickSuit():
	print("Suit will be picked.")
	#lsuit = LCPlayedSuitCheck()
	var rand_int = rand_generate.randi_range(1,4)
	# print random number
	#print (rand_int)

	if rand_int == 1:
		lastsuit = "wands"
	if rand_int == 2:
		lastsuit = "pentacles"
	if rand_int == 3:
		lastsuit = "cups"
	if rand_int == 4:
		lastsuit = "swords"
	lastsuit = "wands+wands"
	if lsuit:
		get_node("Label9").text = "The suit is " + lsuit	
	#var rand_int = rand_generate.randi_range(1,4)
	# print random number
	print(String(rand_int) + " is random for " + lsuit + " lsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuitlsuit")		
		
		
		
			
func pickSuit():
	print("Suit will be picked.")
	#lsuit = LCPlayedSuitCheck()
	var rand_int = rand_generate.randi_range(1,4)
	# print random number
	#print (rand_int)

	if rand_int == 1:
		lsuit = "wands"
		wands = true
		print("wands picked")
		trumps = false
		pentacles = false
		cups = false
		swords = false
		currentsuit = "wands"
#		get_node("Label9").text = "wands"
	if rand_int == 2:
		lsuit = "pentacles"
		pentacles = true
		print("pentacles picked")
		trumps = false
		wands = false
		cups = false
		swords = false
		currentsuit = "pentacles"
	##	get_node("Label9").text = "pentacles"
	if rand_int == 3:
		lsuit = "cups"
		cups = true
		print("cups picked")
		trumps = false
		wands = false
		pentacles = false
		swords = false
		currentsuit = "cups"
	##	get_node("Label9").text = "cups"
	if rand_int == 4:
		lsuit = "swords"
		swords = true
		print("swords picked")
		trumps = false
		wands = false
		pentacles = false
		cups = false
		currentsuit = "swords"
#		get_node("Label9").text = "swords"		
	if lastsuit:
		get_node("Label9").text = "The suit is " + lastsuit	
	#var rand_int = rand_generate.randi_range(1,4)
	# print random number
		print(String(rand_int) + " is random for " + lastsuit + " lastsuitastlsuiasttlsuastitlsastuitlastsuitastlsuiasttlsuitlsuitlsuitlsuitlsuitlsuit")
	
	if currentCardPlayed:
		if int(currentCardPlayed) >= len(scards)-1:#################:
			print("Error: currentCardPlayed is out of bounds")
			return ""
		print(String(currentCardPlayed)) 
		print(scards[int(currentCardPlayed)])
		print("+++++")
		
	if lastsuit == null:
		lastsuit = currentsuit
		if lastsuit != null:
			if lastsuit == currentsuit:
				samesuit = true
				print("the suit is the same condition ::true::")
			else:
				samesuit = false
				print("the suit is not the same ::false::")
		#lastsuit = currentsuit	


	
	
	
	
	
	
	
	
	
	
	
	
	
			
func get_resized_texture(t: Texture, width: int = 0, height: int = 0):
		var image = t.get_data()
		if width > 0 && height > 0:
			image.resize(width, height)
		var itex = ImageTexture.new()
		itex.create_from_image(image)
		return itex

func entered_mouse():
	self.get_node("lighter").show()  
	
func exited_mouse():
	self.get_node("lighter").hide()
	#get_node("HBoxContainer/card" + String(cardcount-1) + "/lighter").hide()



func _on_HBoxContainer_mouse_entered():
	firstrow = true
#	pass # Replace with function body.


func _on_HBoxContainer_mouse_exited():
	firstrow = false
#	pass # Replace with function body.


func _on_HBoxContainer2_mouse_entered():
	secondrow = true
#	pass # Replace with function body.


func _on_HBoxContainer2_mouse_exited():
	secondrow = false
#	pass # Replace with function body.


func _on_Timer_timeout():
	opponentPlayCard()
	get_node("Sprite4/Light2D").hide()
	#pass # Replace with function body.


















#
#
#
#func opponentPlayCard():
#		var oppygone = 0
#		print("the opphand   ")
#
#		for o in opponenthand:
#			print("opponent hand is " + o)
#
#		print("*******************************************look here for index, opponenthand[index]********************************")	
#		for index in range(len(opponenthand)):
#			print(index, opponenthand[index])
#
#		for ophand in opponenthand:
#			#checksuit
#			oppindex = ophand.substr(0,2).to_int()
#				#checkrank
#			if(oppindex > 21 && oppindex < 78):
#				if (ophand.substr(3,4) == lastcardname.substr(3,4)):
#					print("opponent play card for rank" + String(oppindex) + "  -- for card" + lastcardname + " and " + ophand)
#					opponentsamerank = true
#					get_node("Sprite2").texture = actual[oppindex]
#					get_node("Label3").text = ophand#lastcardname#playedcardname#scards[cardcount]
#					get_node("Label4").text = String(cardcount)
#					discardpile.append(ophand)		
#					#remove_card(opponenthand, oppygone)	
#					#opponenthand.remove(ophand)
#					print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#					for index in range(len(opponenthand)):
#						print(index, opponenthand[index])
#						if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#							opponenthand.remove(index - 1)#opponenthand[index]
#					#break
#					#play card of same rank
#					#pass
#
#			if oppindex <= 21:
#				#play the card
#				print("I should play my TRUMP card!!!")
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname#scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)	
#
#				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#				for index in range(len(opponenthand)):
#					print(index, opponenthand[index])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						opponenthand.remove(index - 1)#opponenthand[index]
#
##				break
#			if (oppindex > 21 && oppindex <= 35 && lastsuit == "wands"):
#				print("opponent play card for wands" + String(oppindex))
#				opponentsamesuit = true
#				#play the card
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)			
#				#remove_card(opponenthand, oppygone)
##				opponenthand.remove(ophand)
#				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#				for index in range(len(opponenthand)):
#					print(index, opponenthand[index])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						opponenthand.remove(index - 1)#opponenthand[index]
#				break
#				#pass
#			if(oppindex > 35 && oppindex <= 49 && lastsuit == "pentacles"):
#				print("opponent play card for pentacles" + String(oppindex))
#				opponentsamesuit = true
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)			
#				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#				for index in range(len(opponenthand)):
#					print(index, opponenthand[index])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						opponenthand.remove(index - 1)#opponenthand[index]
#
#				break
#				#play the card
#				#pass
#
#			if (oppindex > 49 && oppindex <= 63 && lastsuit == "cups"):
#				print("opponent play card for cups" + String(oppindex))
#				opponentsamesuit = true	
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)
#				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#				for index in range(len(opponenthand)):
#					print(index, opponenthand[index])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						opponenthand.remove(index - 1)#opponenthand[index]
#
#				break
#				#play the card
#				#pass
#			if (oppindex > 63 && oppindex <= 77 && lastsuit =="swords"):	
#				print("opponent play card for swords" + String(oppindex))
#				opponentsamesuit = true
#				get_node("Sprite2").texture = actual[oppindex]
#				get_node("Label3").text = ophand#playedcardname# scards[cardcount]
#				get_node("Label4").text = String(cardcount)
#				discardpile.append(ophand)			
#
#				print("IN FUNCTION JUNCTION *******************************************look here for index, opponenthand[index]********************************")	
#				for index in range(len(opponenthand)):
#					print(index, opponenthand[index])
#					if(ophand.substr(0,2) == opponenthand[index].substr(0,2)):
#						opponenthand.remove(index - 1)#opponenthand[index]
#				break
#
#			if(oppindex == 78):
#				#currentsuit = "none this is the deckback"
#				print("deckback")
#
#			player = next_turn()
#			oppygone = oppygone + 1
#			if(opponentsamesuit || opponentsamerank):
#				break
#
#


#
#
#func Opponent():
##forreference add in later				discardpile.append(get_node("HBoxContainer/" + selectedcard).cardname)
#	print("opponent:")
#	showcard = scards[cardcount].substr(0,2).to_int()
#	print(String(showcard) + " - " + scards[cardcount])
#	#lastcardname = scards[lastcard]#removinglasCardPlayed for showcard
#
#	if (lastcard != null):
#		get_node("Sprite3").texture = actual[lastcard]#showcard]
#	####discardpile.append(lastcard)##########################################maybe this needs uncommented not sure
##	get_node("Label3").text = lastcardname# scards[cardcount]#######################################################################################################
#	get_node("Label3").text = ("blah" + playedcardname)#scards[lastCardPlayed]# scards[cardcount]#######################################################################################################
#	get_node("Label4").text = String(cardcount)
#
#	#get card for opponent
#	showcard = scards[cardcount].substr(0,2).to_int()
#	print(String(showcard) + " " + scards[cardcount])
#	##########get_node("Sprite").texture = actual[showcard]
#	get_node("Label").text = scards[cardcount]
#	get_node("Label2").text = String(cardcount)
#	#cardcount  = cardcount + 1
#	#countme = false
#	#pass
#	showcard = scards[cardcount].substr(0,2).to_int()
#	###print(String(showcard) + " " + scards[cardcount])
#	get_node("Sprite4").texture = actual[showcard]
#	get_node("Label5").text = scards[cardcount]
#	get_node("Label6").text = String(cardcounttotal)
#	var opponentmsg = "Your Oppenent Took a Card -" + scards[cardcount]
#	get_node("Label7").text = opponentmsg
#
#
#	#######################this section seems off commenting out
##	cardn.append(TextureRect.new())
##	#if cycle == 1:
##	#	cardcount = cardcount + 78
##	cardn[cardcount].set_script(cardscript)
##	var lighter = Light2D.new()
##	lighter.hide()
##	lighter.set_name("lighter")
##	lighter.texture = lightpic
##	lighter.position.x = 40
##	lighter.position.y = 70
##	lighter.scale = s
##	#cardc.append(Control.new())
##	cardn[cardcount].set_name("card" + String(cardcount))
##	cardn[cardcount].cardname = scards[cardcount]
##	#cardc[cardcount].set_name("cardc" + String(cardcount))
##	#cardn[cardcount].texture = actual[showcard] #
##	cardn[cardcount].texture = get_resized_texture(actual[showcard],80,140)
##	#if(Opcc == true):
##
##	cardcount = cardcount + 1
#	#Opcc = false
#		#countme = false
##	lastcardname = scards[cardcount]
#
##&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#
##add to player hand somehow
#	#showcard = cards[cardcount].substr(0,2).to_int()
#	###print(String(showcard) + " " + scards[cardcount])
#	get_node("Sprite4").texture = actual[showcard]
#	#get_node("Label3").text = get_node("Label5").text    # = scards[cardcount]
#	#get_node("Label3").text = scards[cardcount]###????
#	#get_node("Label2").text = String(cardcount)
#
#	cardn.append(TextureRect.new())
#	#if cycle == 1:
#	#	cardcount = cardcount + 78
#	#if(cardn != null):
#	if (cardn[cardcounttotal] != null):
#		cardn[cardcounttotal].set_script(cardscript)
#	###################################################################################################
#	var lighter = Light2D.new()
#	lighter.hide()
#	lighter.set_name("lighter")
#	lighter.texture = lightpic
#	lighter.position.x = 40
#	lighter.position.y = 70
#	lighter.scale = s
#	#cardc.append(Control.new())
#	cardn[cardcounttotal].set_name("card" + String(cardcounttotal))#######################################################maybeuse cardcountcycle here
#
#		#scards discard resued logic is needed
#	cardn[cardcounttotal].cardname = scards[cardcount]
#	#cardc[cardcount].set_name("cardc" + String(cardcount))
#	#cardn[cardcount].texture = actual[showcard] #
#	cardn[cardcounttotal].texture = get_resized_texture(actual[showcard],80,140)
#
#
#
#	cardn[cardcounttotal].connect("mouse_entered", cardn[cardcounttotal], "entered_mouse") 
#	cardn[cardcounttotal].connect("mouse_exited", cardn[cardcounttotal] ,"exited_mouse")
#
##	if handcount < 20:
##		if(get_node("HBoxContainer") != null):
##			get_node("HBoxContainer").add_child(cardn[cardcounttotal])
##		if(get_node("HBoxContainer/card" + String(cardcounttotal)) != null):
##			get_node("HBoxContainer/card" + String(cardcounttotal)).add_child(lighter)
##		handcount = handcount + 1
#		#get_node("HBoxContainer/card" + String(cardcount)).connect("mouse_entered", self, get_node("HBoxContainer/card" + String(cardcount)).entered_mouse())
##	elif handcount >= 20 && handcount2 < 20: # && cycle == 0:
##		if(get_node("HBoxContainer2") != null):
###			get_node("HBoxContainer2").add_child(cardn[cardcounttotal])
##		if(get_node("HBoxContainer2/card" + String(cardcounttotal)) != null):
##			get_node("HBoxContainer2/card" + String(cardcounttotal)).add_child(lighter)
##		handcount2 = handcount2 + 1
#	opponenthand.append(scards[cardcount])
#	######################################################################look at this section for logic
#	##ifplayablecard then add to discard pile#
#	#discardpile.append(scards[cardcount])####
#	##########################################
#	print("----------------------opponent-hand----------------------")
#	print(opponenthand)
#	print("----------------------opponent-hand-end------------------")
#	cardcount = cardcount + 1
#	cardcounttotal = cardcounttotal + 1
#	get_node("Timer").start()
#	#opponentPlayCard()
