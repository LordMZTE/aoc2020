package tasks;

import polygonal.ds.IntHashSet;
import Util.Task;

using StringTools;
using Util.StaticExt;
using Lambda;

class Task6 implements Task {
    public var name = "Day 6: Custom Customs";

    public function new() {}

    public function part1() {
        var input = Util.input();
        var current = new IntHashSet(32);
        var acc = 0;

        for (line in input) {
            if (line == "") {
                acc += current.size;
                current.clear();
                continue;
            }

            for (char in line.iterator())
                current.set(char);
        }

        acc += current.size;

        Sys.println(acc);
    }

    public function part2() {
        var input = Util.input();
        var currentQ = [];
        var currentG = [];
        var groups = [];

        for (line in input) {
            if (line == "") {
                groups.push(currentG);
                currentG = [];
                continue;
            }

            for (char in line.iterator())
                currentQ.push(char);
            currentG.push(currentQ);
            currentQ = [];
        }
        groups.push(currentG);

        var acc = 0;
        for (group in groups)
            acc += group
                .flatten()
                .unique()
                .count(q -> group.foreach(m -> m.contains(q)));

        Sys.println(acc);
    }
}
