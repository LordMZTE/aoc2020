package tasks;

import haxe.iterators.StringIterator;
import Util.Task;

private class Passwd {
    public var min:Int;
    public var max:Int;
    public var charCode:Int;
    public var passwd:String;

    public function new(min, max, charCode, passwd) {
        this.min = min;
        this.max = max;
        this.charCode = charCode;
        this.passwd = passwd;
    }

    public static function parse(s:String):Passwd {
        final parts = s.split(": ");
        final passwd = parts[1];

        final parts = parts[0].split(" ");
        final charCode = parts[1].charCodeAt(0);

        final parts = parts[0].split("-");
        final min = parts[0];
        final max = parts[1];

        return new Passwd(Std.parseInt(min), Std.parseInt(max), charCode, passwd);
    }

    public function valid1():Bool {
        var count = 0;
        for (char in new StringIterator(passwd)) {
            if (char == charCode) {
                count++;
            }
        }
        return min <= count && max >= count;
    }

    public function valid2():Bool {
        return (passwd.charCodeAt(min - 1) == charCode) != (passwd.charCodeAt(max - 1) == charCode);
    }
}

class Task2 implements Task {
    public var name = "Day 2: Password Philosophy";

    public function new() {}

    public function part1() {
        Sys.println(Util.input().map(Passwd.parse).filter(pass -> pass.valid1()).length);
    }

    public function part2() {
        Sys.println(Util.input().map(Passwd.parse).filter(pass -> pass.valid2()).length);
    }
}
