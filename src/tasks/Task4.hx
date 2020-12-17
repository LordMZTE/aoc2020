package tasks;

import Util;

using Lambda;
using Std;
using StringTools;

@:structInit
@:structAccess
class Passport {
    var byr:Null<String>;
    var iyr:Null<String>;
    var eyr:Null<String>;
    var hgt:Null<String>;
    var hcl:Null<String>;
    var ecl:Null<String>;
    var pid:Null<String>;

    public static function parse(lines:Array<String>):Passport {
        var map = new Map();

        for (line in lines)
            for (field in line.split(" ")) {
                var data = field.split(":");
                map[data[0]] = data[1];
            }

        return {
            byr: map["byr"],
            iyr: map["iyr"],
            eyr: map["eyr"],
            hgt: map["hgt"],
            hcl: map["hcl"],
            ecl: map["ecl"],
            pid: map["pid"],
        }
    }

    public static function fromInput(input:Array<String>):Array<Passport> {
        var passports = [];
        var curLines = [];
        for (line in input) {
            if (line == "") {
                passports.push(curLines);
                curLines = [];
            } else {
                curLines.push(line);
            }
        }

        return passports.map(Passport.parse);
    }

    public function valid1():Bool {
        return [byr, iyr, eyr, hgt, hcl, ecl, pid].foreach(x -> x != null);
    }

    public function valid2():Bool {
        if (!valid1())
            return false;

        function checkInRange(val:Int, min:Int, max:Int):Bool {
            return val >= min && val <= max;
        };

        function checkStrInRange(val:String, min:Int, max:Int):Bool {
            return checkInRange(val.parseInt(), min, max);
        };

        if (!(checkStrInRange(byr, 1920, 2002) && checkStrInRange(iyr, 2010, 2020) && checkStrInRange(eyr, 2020, 2030)))
            return false;

        if (! {
            var unit = hgt.substr(hgt.length - 2);
            var amount = hgt.substr(0, hgt.length - 2);

            switch unit {
                case "cm": checkStrInRange(amount, 150, 193);
                case "in": checkStrInRange(amount, 59, 76);
                default: false;
            }
        })
            return false;

        if (hcl.charAt(0) != "#")
            return false;

        for (c in hcl.substr(1))
            if (!"0123456789abcdef".contains(String.fromCharCode(c)))
                return false;

        switch ecl {
            case "amb" | "blu" | "brn" | "gry" | "grn" | "hzl" | "oth":
            default:
                return false;
        }

        if (pid.length != 9 || pid.parseInt() == null)
            return false;

        return true;
    }
}

class Task4 implements Task {
    public var name = "Day 4: Passport Processing";

    public function new() {}

    public function part1() {
        var passports = Passport.fromInput(Util.input());
        var valid = passports.count(p -> p.valid1());
        Sys.println(valid);
    }

    public function part2() {
        var passports = Passport.fromInput(Util.input());
        var valid = passports.count(p -> p.valid2());
        Sys.println(valid);
    }
}
