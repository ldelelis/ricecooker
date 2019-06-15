import std.stdio;
import std.format;
import std.process : environment;
import core.stdc.stdlib : exit;

const string[] AVAILABLE_COMMANDS = ["get", "use"];

enum ExitCodes {
	ERROR = 1
}


string[string] getEnvironmentData() {
	string[string] ret;
	ret["userHomeDir"] = environment.get("HOME");
	ret["userDataDir"] = environment.get(
		"XDG_DATA_HOME",
		"%s/.local/share".format(environment.get("HOME"))
	);
	ret["systemDataDir"] = environment.get(
		"XDG_DATA_DIRS",
		"/usr/local/share/:/usr/share/"
	);

	return ret;
}


void main(string[] args) {
	import core.utils.array: isIncluded;
	if (args.length < 2) {  /* No arguments */
		stderr.writeln("Needs at least one command.");
		exit(ExitCodes.ERROR);
	}

	const string command = args[1];
	if (!isIncluded!string(AVAILABLE_COMMANDS, command)) {
		stderr.writeln("Invalid command.");
		exit(ExitCodes.ERROR);
	}

	string[string] envData = getEnvironmentData();
	writeln(envData);
}
