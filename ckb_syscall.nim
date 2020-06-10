import
  ckb_consts

#proc syscall*(n: clong, a1, a2, a3, a4, a5, a6: any): clong {.cdecl, importc, varargs, header: "/pkg/ckb-c-stdlib/ckb_syscalls.h".}
proc syscall*(n: clong, a1, a2, a3, a4, a5, a6: any): clong {.cdecl, importc: "syscall", varargs, header: "./deps/ckb-c-stdlib/ckb_syscalls.h".}

proc ckb_exit*(code: uint8): clong {.discardable.} =
  return syscall(SYS_exit, code, 0, 0, 0, 0, 0)

proc ckb_load_tx_hash*(`addr`: pointer; len: ptr uint64; offset: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret = syscall(SYS_ckb_load_tx_hash, `addr`, addr(inner_len), offset, 0, 0, 0)
  len[] = inner_len
  return ret

proc ckb_checked_load_tx_hash*(`addr`: pointer; len: ptr uint64; offset: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_tx_hash(`addr`, len, offset)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_script_hash*(`addr`: pointer; len: ptr uint64; offset: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_script_hash, `addr`, addr(inner_len), offset, 0,
                      0, 0)
  len[] = inner_len
  return ret

proc ckb_checked_load_script_hash*(`addr`: pointer; len: ptr uint64; offset: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_script_hash(`addr`, len, offset)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_cell*(`addr`: pointer; len: ptr uint64; offset: csize_t; index: csize_t;
                   source: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_cell, `addr`, addr(inner_len), offset, index,
                      source, 0)
  len[] = inner_len
  return ret

proc ckb_checked_load_cell*(`addr`: pointer; len: ptr uint64; offset: csize_t;
                           index: csize_t; source: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_cell(`addr`, len, offset, index, source)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_input*(`addr`: pointer; len: ptr uint64; offset: csize_t; index: csize_t;
                    source: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_input, `addr`, addr(inner_len), offset, index,
                      source, 0)
  len[] = inner_len
  return ret

proc ckb_checked_load_input*(`addr`: pointer; len: ptr uint64; offset: csize_t;
                            index: csize_t; source: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_input(`addr`, len, offset, index, source)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_header*(`addr`: pointer; len: ptr uint64; offset: csize_t; index: csize_t;
                     source: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_header, `addr`, addr(inner_len), offset, index,
                      source, 0)
  len[] = inner_len
  return ret

proc ckb_checked_load_header*(`addr`: pointer; len: ptr uint64; offset: csize_t;
                             index: csize_t; source: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_header(`addr`, len, offset, index, source)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_witness*(`addr`: pointer; len: ptr uint64; offset: csize_t; index: csize_t;
                      source: int64): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_witness, `addr`, addr(inner_len), offset, index,
                      source, 0)
  len[] = inner_len
  return ret

proc ckb_checked_load_witness*(`addr`: pointer; len: ptr uint64; offset: csize_t;
                              index: csize_t; source: int64): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_witness(`addr`, len, offset, index, source)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_script*(`addr`: pointer; len: ptr uint64; offset: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_script, `addr`, addr(inner_len), offset, 0, 0, 0)
  len[] = inner_len
  return ret

proc ckb_checked_load_script*(`addr`: pointer; len: ptr uint64; offset: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_script(`addr`, len, offset)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_transaction*(`addr`: pointer; len: ptr uint64; offset: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_transaction, `addr`, addr(inner_len), offset, 0,
                      0, 0)
  len[] = inner_len
  return ret

proc ckb_checked_load_transaction*(`addr`: pointer; len: ptr uint64; offset: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_transaction(`addr`, len, offset)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_cell_by_field*(`addr`: pointer; len: ptr uint64; offset: int64;
                            index: int64; source: int64; field: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_cell_by_field, `addr`, addr(inner_len), offset,
                      index, source, field)
  len[] = inner_len
  return ret

proc ckb_checked_load_cell_by_field*(`addr`: pointer; len: ptr uint64;
                                    offset: int64; index: int64; source: int64;
                                    field: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_cell_by_field(`addr`, len, offset, index, source, field)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_header_by_field*(`addr`: pointer; len: ptr uint64; offset: csize_t;
                              index: csize_t; source: csize_t; field: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_header_by_field, `addr`, addr(inner_len),
                      offset, index, source, field)
  len[] = inner_len
  return ret

proc ckb_checked_load_header_by_field*(`addr`: pointer; len: ptr uint64;
                                      offset: csize_t; index: csize_t; source: csize_t;
                                      field: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_header_by_field(`addr`, len, offset, index, source, field)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_input_by_field*(`addr`: pointer; len: ptr uint64; offset: csize_t;
                             index: csize_t; source: csize_t; field: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_input_by_field, `addr`, addr(inner_len), offset,
                      index, source, field)
  len[] = inner_len
  return ret

proc ckb_checked_load_input_by_field*(`addr`: pointer; len: ptr uint64;
                                     offset: csize_t; index: csize_t; source: csize_t;
                                     field: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_input_by_field(`addr`, len, offset, index, source, field)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_load_cell_code*(`addr`: pointer; memory_size: csize_t; content_offset: csize_t;
                        content_size: csize_t; index: csize_t; source: csize_t): clong =
  return syscall(SYS_ckb_load_cell_data_as_code, `addr`, memory_size,
                content_offset, content_size, index, source)

proc ckb_load_cell_data*(`addr`: pointer; len: ptr uint64; offset: csize_t;
                        index: csize_t; source: csize_t): clong =
  var inner_len: uint64 = len[]
  var ret: clong = syscall(SYS_ckb_load_cell_data, `addr`, addr(inner_len), offset,
                      index, source, 0)
  len[] = inner_len
  return ret

proc ckb_checked_load_cell_data*(`addr`: pointer; len: ptr uint64; offset: csize_t;
                                index: csize_t; source: csize_t): clong =
  var old_len: uint64 = len[]
  var ret: clong = ckb_load_cell_data(`addr`, len, offset, index, source)
  if ret == CKB_SUCCESS and (len[]) > old_len:
    ret = CKB_LENGTH_NOT_ENOUGH
  return ret

proc ckb_debug*(s: cstring): clong {.discardable.} =
  return syscall(SYS_ckb_debug, s, 0, 0, 0, 0, 0)

#  load the actual witness for the current type verify group.
#    use this instead of ckb_load_witness if type contract needs args to verify
#    input/output.
#

proc ckb_load_actual_type_witness*(buf: ptr uint8; len: ptr uint64; index: csize_t;
#                                  type_source: ptr csize_t): clong =
                                  type_source: ptr int64): clong =
  type_source[] = CKB_SOURCE_GROUP_INPUT
  var tmp_len: uint64 = 0
  if ckb_load_cell_by_field(nil, addr(tmp_len), 0, 0, CKB_SOURCE_GROUP_INPUT,
                           CKB_CELL_FIELD_CAPACITY) == CKB_INDEX_OUT_OF_BOUND:
    type_source[] = CKB_SOURCE_GROUP_OUTPUT
  return ckb_checked_load_witness(buf, len, 0, index, type_source[])

#  calculate inputs length

proc ckb_calculate_inputs_len*(): csize_t =
  var len: uint64 = 0
  ##  lower bound, at least tx has one input
  var lo: csize_t = 0
  ##  higher bound
  var hi: csize_t = 4
  var ret: clong
  ##  try to load input until failing to increase lo and hi
  while true:
    ret = ckb_load_input_by_field(nil, addr(len), 0, hi, CKB_SOURCE_INPUT,
                                CKB_INPUT_FIELD_SINCE)
    if ret == CKB_SUCCESS:
      lo = hi
      hi = hi * 2
    else:
      break
  ##  now we get our lower bound and higher bound,
  ##    count number of inputs by binary search
#  var i: cint
  var i: uint
  while lo + 1 != hi:
    i = (lo + hi) div 2
    ret = ckb_load_input_by_field(nil, addr(len), 0, i, CKB_SOURCE_INPUT,
                                CKB_INPUT_FIELD_SINCE)
    if ret == CKB_SUCCESS:
      lo = i
    else:
      hi = i
  ##  now lo is last input index and hi is length of inputs
  return hi

##
##  Look for dep cell with specific data hash, data_hash should a buffer with
##  32 bytes.
##

proc ckb_look_for_dep_with_hash*(data_hash: ptr uint8; index: ptr csize_t): clong {.cdecl,
    importc: "ckb_look_for_dep_with_hash", varargs,
    header: "./deps/ckb-c-stdlib/ckb_syscalls.h".}
#proc ckb_look_for_dep_with_hash*(data_hash: ptr uint8; index: ptr csize_t): clong =
#  var current: int64 = 0
#  while current < SIZE_MAX:
#    var len: uint64 = 32
#    var hash: array[32, uint8]
#    var ret: clong = ckb_load_cell_by_field(addr hash, addr(len), 0, current,
#                                       CKB_SOURCE_CELL_DEP,
#                                       CKB_CELL_FIELD_DATA_HASH)
#    case ret
#    of CKB_ITEM_MISSING:
#      nil
#    of CKB_SUCCESS:
#      if memcmp(data_hash, hash, 32) == 0:
#        ##  Found a match
#        index[] = current
#        return CKB_SUCCESS
#    else:
#      return CKB_INDEX_OUT_OF_BOUND
#    inc(current)
#  return CKB_INDEX_OUT_OF_BOUND
