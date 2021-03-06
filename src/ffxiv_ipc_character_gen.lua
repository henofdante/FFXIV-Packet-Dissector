-- This file is generated by tools/json2lua.js

local db = require('ffxiv_db')
local ffxiv_ipc_character = Proto("ffxiv_ipc_character", "FFXIV-IPC Character")

local character_fields = {
  title           = ProtoField.uint32("ffxiv_ipc_character.title", "Title", base.DEC),
  current_server  = ProtoField.uint16("ffxiv_ipc_character.current_server", "Current Server", base.DEC, db.World),
  original_server = ProtoField.uint16("ffxiv_ipc_character.original_server", "Original Server", base.DEC, db.World),
  unknown1        = ProtoField.uint32("ffxiv_ipc_character.unknown1", "Unknown1", base.HEX),
  unknown2        = ProtoField.uint32("ffxiv_ipc_character.unknown2", "Unknown2", base.HEX),
  target_id       = ProtoField.uint32("ffxiv_ipc_character.target_id", "Target ID", base.HEX),
  npc_base        = ProtoField.uint32("ffxiv_ipc_character.npc_base", "NPC Base", base.DEC),
  npc_id          = ProtoField.uint16("ffxiv_ipc_character.npc_id", "NPC ID", base.DEC, db.BNpcName),
  type            = ProtoField.uint16("ffxiv_ipc_character.type", "Type", base.DEC),
  owner_id        = ProtoField.uint32("ffxiv_ipc_character.owner_id", "Owner ID", base.HEX),
  nickname        = ProtoField.string("ffxiv_ipc_character.nickname", "Nickname", base.UNICODE),
}

ffxiv_ipc_character.fields = character_fields

function ffxiv_ipc_character.dissector(tvbuf, pktinfo, root)
  local tree = root:add(ffxiv_ipc_character, tvbuf)
  pktinfo.cols.info:set("Character")

  local len = tvbuf:len()

  -- dissect the title field
  local title_tvbr = tvbuf:range(0, 4)
  local title_val  = title_tvbr:le_uint()
  tree:add_le(character_fields.title, title_tvbr, title_val)

  -- dissect the current_server field
  local current_server_tvbr = tvbuf:range(4, 2)
  local current_server_val  = current_server_tvbr:le_uint()
  tree:add_le(character_fields.current_server, current_server_tvbr, current_server_val)

  -- dissect the original_server field
  local original_server_tvbr = tvbuf:range(6, 2)
  local original_server_val  = original_server_tvbr:le_uint()
  tree:add_le(character_fields.original_server, original_server_tvbr, original_server_val)

  -- dissect the unknown1 field
  local unknown1_tvbr = tvbuf:range(8, 4)
  local unknown1_val  = unknown1_tvbr:le_uint()
  tree:add_le(character_fields.unknown1, unknown1_tvbr, unknown1_val)

  -- dissect the unknown2 field
  local unknown2_tvbr = tvbuf:range(12, 4)
  local unknown2_val  = unknown2_tvbr:le_uint()
  tree:add_le(character_fields.unknown2, unknown2_tvbr, unknown2_val)

  -- dissect the target_id field
  local target_id_tvbr = tvbuf:range(16, 4)
  local target_id_val  = target_id_tvbr:le_uint()
  tree:add_le(character_fields.target_id, target_id_tvbr, target_id_val)

  -- dissect the npc_base field
  local npc_base_tvbr = tvbuf:range(64, 4)
  local npc_base_val  = npc_base_tvbr:le_uint()
  tree:add_le(character_fields.npc_base, npc_base_tvbr, npc_base_val)

  -- dissect the npc_id field
  local npc_id_tvbr = tvbuf:range(68, 2)
  local npc_id_val  = npc_id_tvbr:le_uint()
  tree:add_le(character_fields.npc_id, npc_id_tvbr, npc_id_val)

  -- dissect the type field
  local type_tvbr = tvbuf:range(70, 2)
  local type_val  = type_tvbr:le_uint()
  tree:add_le(character_fields.type, type_tvbr, type_val)

  -- dissect the owner_id field
  local owner_id_tvbr = tvbuf:range(84, 4)
  local owner_id_val  = owner_id_tvbr:le_uint()
  tree:add_le(character_fields.owner_id, owner_id_tvbr, owner_id_val)

  -- dissect the nickname field
  local nickname_tvbr = tvbuf:range(560, 32)
  local nickname_val  = nickname_tvbr:string(ENC_UTF_8)
  tree:add(character_fields.nickname, nickname_tvbr, nickname_val)

  return len
end