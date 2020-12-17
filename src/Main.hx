import tasks.*;

class Main {
	static final tasks = [
		new Task1(),
		new Task2(),
		new Task3(),
		new Task4(),
		new Task5(),
	];

	static function main() {
		for (task in tasks) {
			Sys.println("\nRunning Task \"" + task.name + '\"');
			Sys.println("Part 1");
			task.part1();
			Sys.println("Part 2");
			task.part2();
		}
	}
}
