import std.stdio;
import core.stdc.stdlib : exit;

const string[] AVAILABLE_COMMANDS = ["get", "use"];

void main(string[] args) {
	import core.utils.array: isIncluded;
	const string command = args[1];
	if (!isIncluded!string(AVAILABLE_COMMANDS, command)) {
		stderr.writeln("Invalid command.");
		exit(1);
	}
}
