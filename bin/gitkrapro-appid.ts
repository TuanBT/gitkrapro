import * as program from "commander";

program
  .name("gitkrapro-appid")
  .description("GitKraPro AppId")
  .command("generate", "generate GitKraPro AppId")
  .command("read", "read GitKraPro AppId from config")
  .parse(process.argv);
