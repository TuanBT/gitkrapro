#!/usr/bin/env node

import * as program from "commander";

import {packageJson} from "../global";

program
  .name("gitkrapro")
  .version(packageJson.version)
  .description(packageJson.description)
  .command("about", "about GitKraPro")
  .command("appid", "GitKraPro AppId")
  .command("patcher [actions...]", "GitKraPro patcher")
  .command("secfile [files...]", "read GitKraPro secFile")
  .parse(process.argv);
