package cc;

import lua.Table;
import lua.TableTools;
import haxe.Constraints;
import haxe.extern.Rest;

@:native("peripheral")
extern class Peripheral {
	public static function isPresent(name:String):Bool;
	public static function getType(name:String):String;
	public static function getMethods(name:String):Table<String, Function>;
	public static function call<T>(name:String, method:String, args:Rest<Dynamic>):T;
	public static function wrap<T>(name:String):Null<T>;

	@:native("find")
	private static function _find<T>(type:String, ?filter:(String, T) -> Bool):Dynamic;
	public static function find<T>(type:String, ?filter:(String, T) -> Bool):Table<Int, T> {
		return TableTools.pack(_find(type, filter));
	}

	public static function getNames():Table<Int, String>;
}
