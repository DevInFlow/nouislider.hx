package ;

import haxe.extern.EitherType;
import js.html.StyleSheetList;
import js.html.Element;

@:enum abstract UiSliderEvent(String) from String to String {
    var UPDATE = "update";
    var SLIDE = "slide";
    var SET = "set";
    var CHANGE = "change";
    var START = "start";
    var END = "end";
}

extern class UiSlider {
    public function destroy():Void;
    public function steps():Void;
    public function on(event:String, cb:Array<Float> -> Int -> Array<Float> -> Void):Void;
    public function off(event:String):Void;
    public function get():Dynamic;
    public function set(values:EitherType<Int, Array<Null<Float>>>):Void;
    public function setHandler(handleNumber:Int,to:String,?lookBackward:Bool):Void;
    public function reset():Void;
    public function updateOptions(object:Dynamic):Void;
    public function pips(object:Dynamic):Void;
    public function removePips():Void;
}

@:enum abstract Orientation(String) from String{
    var Vertical = 'vertical';
    var Horizontal = 'horizontal';
}
@:enum abstract Direction(String) from String{
    var LTR = 'ltr';
    var RTL = 'rtl';
}

typedef Options = {
start:Array<Dynamic>,
range:Dynamic,
?step:Int,
?snap:Bool,
?format:Dynamic,
?ariaFormatter:Dynamic,
?connect:Dynamic,
?margin:Int,
?limit:Int,
?padding:Int,
?orientation:Orientation,
?direction:Direction,
?tooltip:Bool,
?animate:Bool,
?animateDuration:Int,
?keyboardSupport:Bool,
?behaviour:String,
?pips:Dynamic,
?documentElement:Element,
?cssPrefix:String,
?cssClasses:Dynamic

}
@:native("noUiSlider")
extern class NoUiSlider {
    public static function create(slider:Element, options:Options):UiSlider;
}