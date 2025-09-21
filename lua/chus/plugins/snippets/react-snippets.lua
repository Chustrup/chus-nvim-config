local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

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
})
