define("ace/snippets/glua",["require","exports","module"], function(require, exports, module) {
"use strict";

exports.snippetText = "snippet local\n\
	local ${1:x} = ${2:1}\n\
snippet fun\n\
	function ${1:fname}(${2:...})\n\
		${3:-- body}\n\
	end\n\
snippet for\n\
	for ${1:i}=${2:1},${3:10} do\n\
		${4:print(i)}\n\
	end\n\
snippet forp\n\
	for ${1:i},${2:v} in pairs(${3:table_name}) do\n\
	   ${4:-- body}\n\
	end\n\
snippet fori\n\
	for ${1:i},${2:v} in ipairs(${3:table_name}) do\n\
	   ${4:-- body}\n\
	end\n\
snippet hookadd\n\
	local function ${1:hookname}(${3:...})\n\
		${4:-- body}\n\
	end\n\
	hook.Add(\"${1:hookname}\",${2:Tag},${1:hookname})\n\
";
exports.scope = "glua";

});
