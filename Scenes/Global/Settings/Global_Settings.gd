extends Node

enum bus_layout{
	Master,
	Music,
	SFX
}

var volume = {
	bus_layout.Master: 1,
	bus_layout.Music: 1,
	bus_layout.SFX: 1
}
