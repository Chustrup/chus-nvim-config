local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

function firstToUpper(str)
	return (str:gsub("^%l", string.upper))
end

ls.add_snippets("typescriptreact", {

	s("ref", {
		t("const "),
		i(1),
		t(" = createRef<"),
		i(2),
		t(">();"),
	}),
	s("sign", {
		t("const "),
		i(1),
		t(" = createSignal<"),
		i(2),
		t(">("),
		i(3),
		t(");"),
	}),

	s(
		"compfc",
		fmt(
			[[
			
	import {{ ReactNode }} from "react";	

	type {}Props = {{
		className?: string;
		children: ReactNode;
	}}

	const {}: React.FC<{}Props> = ({{ className, children }}) => {{
		return (
			{}
		)
	}}

	export default {}
	]],
			{
				i(1),
				rep(1),
				rep(1),
				i(2),
				rep(1),
			}
		)
	),

	s(
		"useS",
		fmt(
			[[
const [{1}, set{2}] = useState({3});
]],
			{

				i(1),
				f(function(args)
					return firstToUpper(args[1][1])
				end, { 1 }),
				i(2),
			}
		)
	),
})
