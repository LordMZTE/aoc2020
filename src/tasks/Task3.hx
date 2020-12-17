package tasks;

import haxe.iterators.StringIterator;
import Util.Task;
import BigInt;

class Task3 implements Task {
    public var name = "Day 3: Toboggan Trajectory";

    public function new() {}

    function grid():Array<Array<Bool>> {
        return Util.input().map(row -> [
            for (c in new StringIterator(row)) {
                switch (c) {
                    case "#".code:
                        true;
                    default:
                        false;
                }
            }
        ]);
    }

    function runForSteps(x:Int, y:Int):Int {
        var input = grid();
        var usedRows = [];
        var trees = 0;
        var current = 0;

        for (i in 0...input.length) {
            if (i % y == 0) {
                usedRows.push(input[i]);
            }
        }

        for (row in usedRows) {
            if (row[current % row.length])
                trees++;

            current += x;
        }

        return trees;
    }

    public function part1() {
        Sys.println(runForSteps(3, 1));
    }

    public function part2() {
        final result = BigInt.fromInt(runForSteps(1, 1)) * runForSteps(3, 1) * runForSteps(5, 1) * runForSteps(7, 1) * runForSteps(1, 2);

        Sys.println(result.toBaseString());
    }
}
