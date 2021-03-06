-- This file is generated by tools/json2lua.js

local ffxiv_ipc_npc_remove = Proto("ffxiv_ipc_npc_remove", "FFXIV-IPC NpcRemove")

local npc_remove_fields = {
  unknown = ProtoField.uint32("ffxiv_ipc_npc_remove.unknown", "Unknown", base.DEC),
  npc_id  = ProtoField.uint32("ffxiv_ipc_npc_remove.npc_id", "NpcId", base.HEX),
}

ffxiv_ipc_npc_remove.fields = npc_remove_fields

function ffxiv_ipc_npc_remove.dissector(tvbuf, pktinfo, root)
  local tree = root:add(ffxiv_ipc_npc_remove, tvbuf)
  pktinfo.cols.info:set("NpcRemove")

  local len = tvbuf:len()

  -- dissect the unknown field
  local unknown_tvbr = tvbuf:range(0, 4)
  local unknown_val  = unknown_tvbr:le_uint()
  tree:add_le(npc_remove_fields.unknown, unknown_tvbr, unknown_val)

  -- dissect the npc_id field
  local npc_id_tvbr = tvbuf:range(4, 4)
  local npc_id_val  = npc_id_tvbr:le_uint()
  tree:add_le(npc_remove_fields.npc_id, npc_id_tvbr, npc_id_val)

  return len
end