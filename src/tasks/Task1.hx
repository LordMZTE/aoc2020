package tasks;

import Util.Task;

class Task1 implements Task {
    public var name = "Day 1: Report Repair";

    public function new() {}

    public function part1() {
        var values = Util.input().map(Std.parseInt);

        for (i in values)
            for (j in values)
                if (i + j == 2020) {
                    Sys.println(i * j);
                    return;
                }
    }

    public function part2() {
        var values = Util.input().map(Std.parseInt);
        for (i in values)
            for (j in values)
                for (k in values)
                    if (i + j + k == 2020) {
                        Sys.println(i * j * k);
                        return;
                    }
    }
}
