import sys.io.File;
import haxe.io.Path;

class Util {
    public static function inputForClassName(name:String):Array<String> {
        var inputFile = Path.join(["input", name + ".txt"]);
        var lines = new Array<String>();
        var inputFile = File.read(inputFile);
        while (true) {
            try {
                lines.push(inputFile.readLine());
            } catch (_) {
                break;
            }
        }
        return lines;
    }

    public static macro function input():ExprOf<Array<String>> {
        var localClass = haxe.macro.Context.getLocalClass().get().name;
        return macro {Util.inputForClassName($v{localClass});};
    }
}

class StaticExt {
    public static function unique<T>(array:Array<T>):Array<T> {
        final unique = [];
        for (element in array) {
            var present = false;
            for (unique in unique)
                if (unique == element)
                    present = true;
            if (!present)
                unique.push(element);
        }
        return unique;
    }
}

interface Task {
    function part1():Void;

    function part2():Void;

    var name:String;
}
