import { FSH } from "https://code4fukui.github.io/FSH/FSH.js";
import { dir2array } from "https://js.sabae.cc/dir2array.js";

const fns = await dir2array("src");
for (const fn of fns) {
  if (!fn.endsWith(".fsh")) continue;
  const fsh = await Deno.readTextFile("src/" + fn);
  const json = FSH.toJSON(fsh);
  const fn2 = fn.substring(0, fn.lastIndexOf(".")) + ".json";
  const dir = fn.substring(0, fn.lastIndexOf("/"));
  await Deno.mkdir("static/" + dir, { recursive: true });
  await Deno.writeTextFile("static/" + fn2, JSON.stringify(json, null, 2));
}
