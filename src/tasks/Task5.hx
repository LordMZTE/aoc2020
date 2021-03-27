package tasks;

import Util.Task;

using StringTools;
using Lambda;

typedef SeatPos = {
    x:Int,
    y:Int,
}

class Task5 implements Task {
    public var name = "Day 5: Binary Boarding";

    public function new() {}

    static function pos(seat:String):SeatPos {
        var row = seat.substr(0, 7);
        var column = seat.substr(seat.length - 3);

        var maxX = 127;
        var minX = 0;

        var maxY = 7;
        var minY = 0;

        for (r in row.iterator()) {
            var half = Std.int((maxX + 1 - minX) / 2);
            switch r {
                case "F".code:
                    maxX -= half;
                case "B".code:
                    minX += half;
            }
        }

        for (c in column.iterator()) {
            var half = Std.int((maxY + 1 - minY) / 2);
            switch c {
                case "L".code:
                    maxY -= half;
                case "R".code:
                    minY += half;
            }
        }

        return {x: minX, y: minY};
    }

    static function seatId(seat:SeatPos):Int {
        return seat.x * 8 + seat.y;
    }

    public function part1() {
        var input = Util
            .input()
            .map(pos)
            .map(seatId);

        var largest:Null<Int> = null;
        for (seat in input)
            if (seat > largest || largest == null)
                largest = seat;

        Sys.println(largest);
    }

    public function part2() {
        final seatIds = Util
            .input()
            .map(pos)
            .map(seatId);
        seatIds.sort(Reflect.compare);
        var prevId = seatIds.shift();
        for (id in seatIds) {
            final expectedId = prevId + 1;
            if (id != expectedId) {
                Sys.println(expectedId);
                return;
            }
            prevId = id;
        }
        throw "seat id not found";
    }
}
