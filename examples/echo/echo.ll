; ModuleID = 'echo.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.EchoTest = type <{ %class.Module, %class.Echo*, i32, [4 x i8] }>
%class.Module = type { %class.Rule*, %class.Module*, i64 }
%class.Rule = type { i32 (...)**, %class.Rule* }
%class.Echo = type <{ %class.Module, %class.Fifo*, %class.EchoIndication*, i32, [4 x i8] }>
%class.Fifo = type { i32 (...)**, %class.Module }
%class.EchoIndication = type { i8 }
%struct.__block_descriptor = type { i64, i64 }
%class.Fifo1 = type <{ %class.Fifo, i32, i8, [3 x i8] }>

$_ZN8EchoTestC2Ev = comdat any

$_ZN8EchoTestD2Ev = comdat any

$_ZN6ModuleC2Em = comdat any

$_ZN14EchoIndicationC2Ev = comdat any

$_ZN4EchoC2EP14EchoIndication = comdat any

$_ZN5Fifo1IiEC2Ev = comdat any

$_ZN4FifoIiEC2Em = comdat any

$_ZN5Fifo1IiED2Ev = comdat any

$_ZN5Fifo1IiED0Ev = comdat any

$_ZN5Fifo1IiE8enq__RDYEv = comdat any

$_ZN5Fifo1IiE3enqEi = comdat any

$_ZN5Fifo1IiE8deq__RDYEv = comdat any

$_ZN5Fifo1IiE3deqEv = comdat any

$_ZN5Fifo1IiE10first__RDYEv = comdat any

$_ZN5Fifo1IiE5firstEv = comdat any

$_ZNK5Fifo1IiE8notEmptyEv = comdat any

$_ZNK5Fifo1IiE7notFullEv = comdat any

$_ZN4FifoIiED2Ev = comdat any

$_ZN4FifoIiED0Ev = comdat any

$_ZN4FifoIiE8enq__RDYEv = comdat any

$_ZN4FifoIiE8deq__RDYEv = comdat any

$_ZN4FifoIiE10first__RDYEv = comdat any

$_ZTV5Fifo1IiE = comdat any

$_ZTS5Fifo1IiE = comdat any

$_ZTS4FifoIiE = comdat any

$_ZTS6Module = comdat any

$_ZTI6Module = comdat any

$_ZTI4FifoIiE = comdat any

$_ZTI5Fifo1IiE = comdat any

$_ZTV4FifoIiE = comdat any

@.str = private unnamed_addr constant [19 x i8] c"Heard an echo: %d\0A\00", align 1
@stop_main_program = external global i32, align 4
@echoTest = global %class.EchoTest zeroinitializer, align 8
@.str.1 = private unnamed_addr constant [21 x i8] c"[%s:%d] starting %d\0A\00", align 1
@__FUNCTION__.main = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"[%s:%d] ending\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"EchoTest: addr %p size 0x%lx csize 0x%lx\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"drive\00", align 1
@_NSConcreteGlobalBlock = external global i8*
@.str.5 = private unnamed_addr constant [6 x i8] c"B8@?0\00", align 1
@__block_descriptor_tmp = internal constant { i64, i64, i8*, i8* } { i64 0, i64 32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), i8* null }
@__block_literal_global = internal constant { i8**, i32, i32, i8*, %struct.__block_descriptor* } { i8** @_NSConcreteGlobalBlock, i32 1342177280, i32 0, i8* bitcast (i1 (i8*)* @___ZN8EchoTestC2Ev_block_invoke to i8*), %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8* }* @__block_descriptor_tmp to %struct.__block_descriptor*) }, align 8
@_NSConcreteStackBlock = external global i8*
@.str.6 = private unnamed_addr constant [6 x i8] c"v8@?0\00", align 1
@__block_descriptor_tmp.7 = internal constant { i64, i64, i8*, i8* } { i64 0, i64 40, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* null }
@_ZN6Module5firstE = external global %class.Module*, align 8
@.str.8 = private unnamed_addr constant [57 x i8] c"[%s] add module to list first [%p]=%p this %p size %ld.\0A\00", align 1
@__FUNCTION__._ZN6ModuleC2Em = private unnamed_addr constant [7 x i8] c"Module\00", align 1
@.str.9 = private unnamed_addr constant [46 x i8] c"Echo: this %p size 0x%lx fifo %p csize 0x%lx\0A\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"respond\00", align 1
@__block_descriptor_tmp.11 = internal constant { i64, i64, i8*, i8* } { i64 0, i64 32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), i8* null }
@__block_literal_global.12 = internal constant { i8**, i32, i32, i8*, %struct.__block_descriptor* } { i8** @_NSConcreteGlobalBlock, i32 1342177280, i32 0, i8* bitcast (i1 (i8*)* @___ZN4EchoC2EP14EchoIndication_block_invoke to i8*), %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8* }* @__block_descriptor_tmp.11 to %struct.__block_descriptor*) }, align 8
@__block_descriptor_tmp.13 = internal constant { i64, i64, i8*, i8* } { i64 0, i64 40, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* null }
@_ZTV5Fifo1IiE = linkonce_odr unnamed_addr constant [12 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI5Fifo1IiE to i8*), i8* bitcast (void (%class.Fifo1*)* @_ZN5Fifo1IiED2Ev to i8*), i8* bitcast (void (%class.Fifo1*)* @_ZN5Fifo1IiED0Ev to i8*), i8* bitcast (i1 (%class.Fifo1*)* @_ZN5Fifo1IiE8enq__RDYEv to i8*), i8* bitcast (void (%class.Fifo1*, i32)* @_ZN5Fifo1IiE3enqEi to i8*), i8* bitcast (i1 (%class.Fifo1*)* @_ZN5Fifo1IiE8deq__RDYEv to i8*), i8* bitcast (void (%class.Fifo1*)* @_ZN5Fifo1IiE3deqEv to i8*), i8* bitcast (i1 (%class.Fifo1*)* @_ZN5Fifo1IiE10first__RDYEv to i8*), i8* bitcast (i32 (%class.Fifo1*)* @_ZN5Fifo1IiE5firstEv to i8*), i8* bitcast (i1 (%class.Fifo1*)* @_ZNK5Fifo1IiE8notEmptyEv to i8*), i8* bitcast (i1 (%class.Fifo1*)* @_ZNK5Fifo1IiE7notFullEv to i8*)], comdat, align 8
@.str.14 = private unnamed_addr constant [27 x i8] c"Fifo1: addr %p size 0x%lx\0A\00", align 1
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS5Fifo1IiE = linkonce_odr constant [10 x i8] c"5Fifo1IiE\00", comdat
@_ZTVN10__cxxabiv121__vmi_class_type_infoE = external global i8*
@_ZTS4FifoIiE = linkonce_odr constant [9 x i8] c"4FifoIiE\00", comdat
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTS6Module = linkonce_odr constant [8 x i8] c"6Module\00", comdat
@_ZTI6Module = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @_ZTS6Module, i32 0, i32 0) }, comdat
@_ZTI4FifoIiE = linkonce_odr constant { i8*, i8*, i32, i32, i8*, i64 } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @_ZTS4FifoIiE, i32 0, i32 0), i32 0, i32 1, i8* bitcast ({ i8*, i8* }* @_ZTI6Module to i8*), i64 2050 }, comdat
@_ZTI5Fifo1IiE = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @_ZTS5Fifo1IiE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTI4FifoIiE to i8*) }, comdat
@_ZTV4FifoIiE = linkonce_odr unnamed_addr constant [12 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTI4FifoIiE to i8*), i8* bitcast (void (%class.Fifo*)* @_ZN4FifoIiED2Ev to i8*), i8* bitcast (void (%class.Fifo*)* @_ZN4FifoIiED0Ev to i8*), i8* bitcast (i1 (%class.Fifo*)* @_ZN4FifoIiE8enq__RDYEv to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (i1 (%class.Fifo*)* @_ZN4FifoIiE8deq__RDYEv to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (i1 (%class.Fifo*)* @_ZN4FifoIiE10first__RDYEv to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)], comdat, align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_echo.cpp, i8* null }]

; Function Attrs: nounwind
define void @_ZN14EchoIndication4echoEi(i32 %v) #0 align 2 {
entry:
  %v.addr = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %v.addr, metadata !248, metadata !249), !dbg !250
  %0 = load i32, i32* %v.addr, align 4, !dbg !251
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !252
  store i32 1, i32* @stop_main_program, align 4, !dbg !253
  ret void, !dbg !254
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
entry:
  call void @_ZN8EchoTestC2Ev(%class.EchoTest* @echoTest), !dbg !255
  %0 = call i32 @atexit(void ()* @__dtor_echoTest) #3, !dbg !255
  ret void, !dbg !255
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN8EchoTestC2Ev(%class.EchoTest* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.EchoTest*, align 8
  %block = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>, align 8
  store %class.EchoTest* %this, %class.EchoTest** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoTest** %this.addr, metadata !256, metadata !249), !dbg !258
  %this1 = load %class.EchoTest*, %class.EchoTest** %this.addr
  %0 = bitcast %class.EchoTest* %this1 to %class.Module*, !dbg !259
  call void @_ZN6ModuleC2Em(%class.Module* %0, i64 48), !dbg !260
  %echo = getelementptr inbounds %class.EchoTest, %class.EchoTest* %this1, i32 0, i32 1, !dbg !261
  %call = call noalias i8* @_Znwm(i64 48) #6, !dbg !262
  %1 = bitcast i8* %call to %class.Echo*, !dbg !262
  %call2 = call noalias i8* @_Znwm(i64 1) #6, !dbg !263
  %2 = bitcast i8* %call2 to %class.EchoIndication*, !dbg !263
  call void @_ZN14EchoIndicationC2Ev(%class.EchoIndication* %2), !dbg !264
  call void @_ZN4EchoC2EP14EchoIndication(%class.Echo* %1, %class.EchoIndication* %2), !dbg !265
  store %class.Echo* %1, %class.Echo** %echo, align 8, !dbg !261
  %x = getelementptr inbounds %class.EchoTest, %class.EchoTest* %this1, i32 0, i32 2, !dbg !266
  store i32 7, i32* %x, align 4, !dbg !266
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), %class.EchoTest* %this1, i64 40, i64 40), !dbg !267
  %3 = bitcast %class.EchoTest* %this1 to i8*, !dbg !269
  %block.isa = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>* %block, i32 0, i32 0, !dbg !269
  store i8* bitcast (i8** @_NSConcreteStackBlock to i8*), i8** %block.isa, !dbg !269
  %block.flags = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>* %block, i32 0, i32 1, !dbg !269
  store i32 1073741824, i32* %block.flags, !dbg !269
  %block.reserved = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>* %block, i32 0, i32 2, !dbg !269
  store i32 0, i32* %block.reserved, !dbg !269
  %block.invoke = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>* %block, i32 0, i32 3, !dbg !269
  store i8* bitcast (void (i8*)* @___ZN8EchoTestC2Ev_block_invoke_2 to i8*), i8** %block.invoke, !dbg !269
  %block.descriptor = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>* %block, i32 0, i32 4, !dbg !269
  store %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8* }* @__block_descriptor_tmp.7 to %struct.__block_descriptor*), %struct.__block_descriptor** %block.descriptor, !dbg !269
  %block.captured-this.addr = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>* %block, i32 0, i32 5, !dbg !269
  store %class.EchoTest* %this1, %class.EchoTest** %block.captured-this.addr, !dbg !269
  %4 = bitcast <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>* %block to void ()*, !dbg !269
  call void @addBaseRule(i8* %3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0), i1 ()* bitcast ({ i8**, i32, i32, i8*, %struct.__block_descriptor* }* @__block_literal_global to i1 ()*), void ()* %4), !dbg !269
  ret void, !dbg !270
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN8EchoTestD2Ev(%class.EchoTest* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.EchoTest*, align 8
  store %class.EchoTest* %this, %class.EchoTest** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoTest** %this.addr, metadata !271, metadata !249), !dbg !272
  %this1 = load %class.EchoTest*, %class.EchoTest** %this.addr
  ret void, !dbg !273
}

; Function Attrs: nounwind
define internal void @__dtor_echoTest() #0 section ".text.startup" {
entry:
  call void @_ZN8EchoTestD2Ev(%class.EchoTest* @echoTest), !dbg !274
  ret void, !dbg !274
}

; Function Attrs: nounwind
declare i32 @atexit(void ()*) #3

; Function Attrs: nounwind
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !275, metadata !249), !dbg !276
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !277, metadata !249), !dbg !278
  %0 = load i32, i32* %argc.addr, align 4, !dbg !279
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__FUNCTION__.main, i32 0, i32 0), i32 85, i32 %0), !dbg !280
  %1 = load i32, i32* %argc.addr, align 4, !dbg !281
  %cmp = icmp ne i32 %1, 1, !dbg !283
  br i1 %cmp, label %if.then, label %if.end, !dbg !284

if.then:                                          ; preds = %entry
  call void @_Z16run_main_programv(), !dbg !285
  br label %if.end, !dbg !285

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__FUNCTION__.main, i32 0, i32 0), i32 88), !dbg !286
  ret i32 0, !dbg !287
}

declare void @_Z16run_main_programv() #2

; Function Attrs: nounwind
define linkonce_odr void @_ZN6ModuleC2Em(%class.Module* %this, i64 %size) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Module*, align 8
  %size.addr = alloca i64, align 8
  store %class.Module* %this, %class.Module** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Module** %this.addr, metadata !288, metadata !249), !dbg !289
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !290, metadata !249), !dbg !291
  %this1 = load %class.Module*, %class.Module** %this.addr
  %rfirst = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 0, !dbg !292
  store %class.Rule* null, %class.Rule** %rfirst, align 8, !dbg !292
  %next = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 1, !dbg !293
  %0 = load %class.Module*, %class.Module** @_ZN6Module5firstE, align 8, !dbg !294
  store %class.Module* %0, %class.Module** %next, align 8, !dbg !293
  %size2 = getelementptr inbounds %class.Module, %class.Module* %this1, i32 0, i32 2, !dbg !295
  %1 = load i64, i64* %size.addr, align 8, !dbg !296
  store i64 %1, i64* %size2, align 8, !dbg !295
  %2 = load %class.Module*, %class.Module** @_ZN6Module5firstE, align 8, !dbg !297
  %3 = load i64, i64* %size.addr, align 8, !dbg !299
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @__FUNCTION__._ZN6ModuleC2Em, i32 0, i32 0), %class.Module** @_ZN6Module5firstE, %class.Module* %2, %class.Module* %this1, i64 %3), !dbg !300
  store %class.Module* %this1, %class.Module** @_ZN6Module5firstE, align 8, !dbg !301
  ret void, !dbg !302
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #4

; Function Attrs: nounwind
define linkonce_odr void @_ZN14EchoIndicationC2Ev(%class.EchoIndication* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.EchoIndication*, align 8
  store %class.EchoIndication* %this, %class.EchoIndication** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoIndication** %this.addr, metadata !303, metadata !249), !dbg !304
  %this1 = load %class.EchoIndication*, %class.EchoIndication** %this.addr
  ret void, !dbg !305
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4EchoC2EP14EchoIndication(%class.Echo* %this, %class.EchoIndication* %ind) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Echo*, align 8
  %ind.addr = alloca %class.EchoIndication*, align 8
  %block = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>, align 8
  store %class.Echo* %this, %class.Echo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Echo** %this.addr, metadata !306, metadata !249), !dbg !307
  store %class.EchoIndication* %ind, %class.EchoIndication** %ind.addr, align 8
  call void @llvm.dbg.declare(metadata %class.EchoIndication** %ind.addr, metadata !308, metadata !249), !dbg !309
  %this1 = load %class.Echo*, %class.Echo** %this.addr
  %0 = bitcast %class.Echo* %this1 to %class.Module*, !dbg !310
  call void @_ZN6ModuleC2Em(%class.Module* %0, i64 48), !dbg !311
  %fifo = getelementptr inbounds %class.Echo, %class.Echo* %this1, i32 0, i32 1, !dbg !312
  %call = call noalias i8* @_Znwm(i64 40) #6, !dbg !313
  %1 = bitcast i8* %call to %class.Fifo1*, !dbg !313
  call void @_ZN5Fifo1IiEC2Ev(%class.Fifo1* %1), !dbg !314
  %2 = bitcast %class.Fifo1* %1 to %class.Fifo*, !dbg !313
  store %class.Fifo* %2, %class.Fifo** %fifo, align 8, !dbg !312
  %ind2 = getelementptr inbounds %class.Echo, %class.Echo* %this1, i32 0, i32 2, !dbg !315
  %3 = load %class.EchoIndication*, %class.EchoIndication** %ind.addr, align 8, !dbg !316
  store %class.EchoIndication* %3, %class.EchoIndication** %ind2, align 8, !dbg !315
  %fifo3 = getelementptr inbounds %class.Echo, %class.Echo* %this1, i32 0, i32 1, !dbg !317
  %4 = load %class.Fifo*, %class.Fifo** %fifo3, align 8, !dbg !317
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.9, i32 0, i32 0), %class.Echo* %this1, i64 48, %class.Fifo* %4, i64 48), !dbg !319
  %5 = bitcast %class.Echo* %this1 to i8*, !dbg !320
  %block.isa = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>* %block, i32 0, i32 0, !dbg !320
  store i8* bitcast (i8** @_NSConcreteStackBlock to i8*), i8** %block.isa, !dbg !320
  %block.flags = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>* %block, i32 0, i32 1, !dbg !320
  store i32 1073741824, i32* %block.flags, !dbg !320
  %block.reserved = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>* %block, i32 0, i32 2, !dbg !320
  store i32 0, i32* %block.reserved, !dbg !320
  %block.invoke = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>* %block, i32 0, i32 3, !dbg !320
  store i8* bitcast (void (i8*)* @___ZN4EchoC2EP14EchoIndication_block_invoke_2 to i8*), i8** %block.invoke, !dbg !320
  %block.descriptor = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>* %block, i32 0, i32 4, !dbg !320
  store %struct.__block_descriptor* bitcast ({ i64, i64, i8*, i8* }* @__block_descriptor_tmp.13 to %struct.__block_descriptor*), %struct.__block_descriptor** %block.descriptor, !dbg !320
  %block.captured-this.addr = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>* %block, i32 0, i32 5, !dbg !320
  store %class.Echo* %this1, %class.Echo** %block.captured-this.addr, !dbg !320
  %6 = bitcast <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>* %block to void ()*, !dbg !320
  call void @addBaseRule(i8* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i32 0, i32 0), i1 ()* bitcast ({ i8**, i32, i32, i8*, %struct.__block_descriptor* }* @__block_literal_global.12 to i1 ()*), void ()* %6), !dbg !320
  ret void, !dbg !321
}

declare void @addBaseRule(i8*, i8*, i1 ()*, void ()*) #2

; Function Attrs: nounwind
define internal zeroext i1 @___ZN8EchoTestC2Ev_block_invoke(i8* %.block_descriptor) #0 {
entry:
  %.block_descriptor.addr = alloca i8*, align 8
  %block.addr = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>*, align 8
  store i8* %.block_descriptor, i8** %.block_descriptor.addr, align 8
  %0 = load i8*, i8** %.block_descriptor.addr
  call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !322, metadata !249), !dbg !335
  call void @llvm.dbg.declare(metadata i8* %.block_descriptor, metadata !322, metadata !249), !dbg !335
  %block = bitcast i8* %.block_descriptor to <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>*, !dbg !335
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>* %block, <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>** %block.addr, align 8
  ret i1 true, !dbg !336
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
define internal void @___ZN8EchoTestC2Ev_block_invoke_2(i8* %.block_descriptor) #0 {
entry:
  %.block_descriptor.addr = alloca i8*, align 8
  %block.addr = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>*, align 8
  store i8* %.block_descriptor, i8** %.block_descriptor.addr, align 8
  %0 = load i8*, i8** %.block_descriptor.addr
  call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !338, metadata !249), !dbg !345
  call void @llvm.dbg.declare(metadata i8* %.block_descriptor, metadata !338, metadata !249), !dbg !345
  %block = bitcast i8* %.block_descriptor to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>*, !dbg !345
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>* %block, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>** %block.addr, align 8
  %block.captured-this = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.EchoTest* }>* %block, i32 0, i32 5, !dbg !345
  %this = load %class.EchoTest*, %class.EchoTest** %block.captured-this, !dbg !345
  %echo = getelementptr inbounds %class.EchoTest, %class.EchoTest* %this, i32 0, i32 1, !dbg !346
  %1 = load %class.Echo*, %class.Echo** %echo, align 8, !dbg !346
  %fifo = getelementptr inbounds %class.Echo, %class.Echo* %1, i32 0, i32 1, !dbg !346
  %2 = load %class.Fifo*, %class.Fifo** %fifo, align 8, !dbg !346
  %3 = bitcast %class.Fifo* %2 to void (%class.Fifo*, i32)***, !dbg !346
  %vtable = load void (%class.Fifo*, i32)**, void (%class.Fifo*, i32)*** %3, !dbg !346
  %vfn = getelementptr inbounds void (%class.Fifo*, i32)*, void (%class.Fifo*, i32)** %vtable, i64 3, !dbg !346
  %4 = load void (%class.Fifo*, i32)*, void (%class.Fifo*, i32)** %vfn, !dbg !346
  call void %4(%class.Fifo* %2, i32 22), !dbg !346
  ret void, !dbg !345
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiEC2Ev(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !348, metadata !249), !dbg !350
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to %class.Fifo*, !dbg !351
  call void @_ZN4FifoIiEC2Em(%class.Fifo* %0, i64 40), !dbg !352
  %1 = bitcast %class.Fifo1* %this1 to i32 (...)***, !dbg !351
  store i32 (...)** bitcast (i8** getelementptr inbounds ([12 x i8*], [12 x i8*]* @_ZTV5Fifo1IiE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, !dbg !351
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !353
  store i8 0, i8* %full, align 1, !dbg !353
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.14, i32 0, i32 0), %class.Fifo1* %this1, i64 40), !dbg !354
  ret void, !dbg !356
}

; Function Attrs: nounwind
define internal zeroext i1 @___ZN4EchoC2EP14EchoIndication_block_invoke(i8* %.block_descriptor) #0 {
entry:
  %.block_descriptor.addr = alloca i8*, align 8
  %block.addr = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>*, align 8
  store i8* %.block_descriptor, i8** %.block_descriptor.addr, align 8
  %0 = load i8*, i8** %.block_descriptor.addr
  call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !357, metadata !249), !dbg !366
  call void @llvm.dbg.declare(metadata i8* %.block_descriptor, metadata !357, metadata !249), !dbg !366
  %block = bitcast i8* %.block_descriptor to <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>*, !dbg !366
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>* %block, <{ i8*, i32, i32, i8*, %struct.__block_descriptor* }>** %block.addr, align 8
  ret i1 true, !dbg !367
}

; Function Attrs: nounwind
define internal void @___ZN4EchoC2EP14EchoIndication_block_invoke_2(i8* %.block_descriptor) #0 {
entry:
  %.block_descriptor.addr = alloca i8*, align 8
  %block.addr = alloca <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>*, align 8
  store i8* %.block_descriptor, i8** %.block_descriptor.addr, align 8
  %0 = load i8*, i8** %.block_descriptor.addr
  call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !369, metadata !249), !dbg !375
  call void @llvm.dbg.declare(metadata i8* %.block_descriptor, metadata !369, metadata !249), !dbg !375
  %block = bitcast i8* %.block_descriptor to <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>*, !dbg !375
  store <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>* %block, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>** %block.addr, align 8
  %block.captured-this = getelementptr inbounds <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>, <{ i8*, i32, i32, i8*, %struct.__block_descriptor*, %class.Echo* }>* %block, i32 0, i32 5, !dbg !375
  %this = load %class.Echo*, %class.Echo** %block.captured-this, !dbg !375
  %fifo = getelementptr inbounds %class.Echo, %class.Echo* %this, i32 0, i32 1, !dbg !376
  %1 = load %class.Fifo*, %class.Fifo** %fifo, align 8, !dbg !376
  %2 = bitcast %class.Fifo* %1 to void (%class.Fifo*)***, !dbg !376
  %vtable = load void (%class.Fifo*)**, void (%class.Fifo*)*** %2, !dbg !376
  %vfn = getelementptr inbounds void (%class.Fifo*)*, void (%class.Fifo*)** %vtable, i64 5, !dbg !376
  %3 = load void (%class.Fifo*)*, void (%class.Fifo*)** %vfn, !dbg !376
  call void %3(%class.Fifo* %1), !dbg !376
  %ind = getelementptr inbounds %class.Echo, %class.Echo* %this, i32 0, i32 2, !dbg !376
  %4 = load %class.EchoIndication*, %class.EchoIndication** %ind, align 8, !dbg !376
  %fifo1 = getelementptr inbounds %class.Echo, %class.Echo* %this, i32 0, i32 1, !dbg !376
  %5 = load %class.Fifo*, %class.Fifo** %fifo1, align 8, !dbg !376
  %6 = bitcast %class.Fifo* %5 to i32 (%class.Fifo*)***, !dbg !376
  %vtable2 = load i32 (%class.Fifo*)**, i32 (%class.Fifo*)*** %6, !dbg !376
  %vfn3 = getelementptr inbounds i32 (%class.Fifo*)*, i32 (%class.Fifo*)** %vtable2, i64 7, !dbg !376
  %7 = load i32 (%class.Fifo*)*, i32 (%class.Fifo*)** %vfn3, !dbg !376
  %call = call i32 %7(%class.Fifo* %5), !dbg !376
  call void @_ZN14EchoIndication4echoEi(i32 %call), !dbg !376
  ret void, !dbg !375
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4FifoIiEC2Em(%class.Fifo* %this, i64 %size) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  %size.addr = alloca i64, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !378, metadata !249), !dbg !379
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !380, metadata !249), !dbg !381
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i8*, !dbg !382
  %1 = getelementptr inbounds i8, i8* %0, i64 8, !dbg !382
  %2 = bitcast i8* %1 to %class.Module*, !dbg !382
  %3 = load i64, i64* %size.addr, align 8, !dbg !383
  call void @_ZN6ModuleC2Em(%class.Module* %2, i64 %3), !dbg !384
  %4 = bitcast %class.Fifo* %this1 to i32 (...)***, !dbg !382
  store i32 (...)** bitcast (i8** getelementptr inbounds ([12 x i8*], [12 x i8*]* @_ZTV4FifoIiE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %4, !dbg !382
  ret void, !dbg !385
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiED2Ev(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !386, metadata !249), !dbg !387
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to %class.Fifo*, !dbg !388
  call void @_ZN4FifoIiED2Ev(%class.Fifo* %0) #3, !dbg !388
  ret void, !dbg !390
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiED0Ev(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !391, metadata !249), !dbg !392
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  call void @_ZN5Fifo1IiED2Ev(%class.Fifo1* %this1) #3, !dbg !393
  %0 = bitcast %class.Fifo1* %this1 to i8*, !dbg !393
  call void @_ZdlPv(i8* %0) #7, !dbg !393
  ret void, !dbg !394
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN5Fifo1IiE8enq__RDYEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !395, metadata !249), !dbg !396
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to i1 (%class.Fifo1*)***, !dbg !397
  %vtable = load i1 (%class.Fifo1*)**, i1 (%class.Fifo1*)*** %0, !dbg !397
  %vfn = getelementptr inbounds i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vtable, i64 9, !dbg !397
  %1 = load i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vfn, !dbg !397
  %call = call zeroext i1 %1(%class.Fifo1* %this1), !dbg !397
  ret i1 %call, !dbg !397
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiE3enqEi(%class.Fifo1* %this, i32 %v) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  %v.addr = alloca i32, align 4
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !398, metadata !249), !dbg !399
  store i32 %v, i32* %v.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %v.addr, metadata !400, metadata !249), !dbg !401
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = load i32, i32* %v.addr, align 4, !dbg !402
  %element = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 1, !dbg !403
  store i32 %0, i32* %element, align 4, !dbg !404
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !405
  store i8 1, i8* %full, align 1, !dbg !406
  ret void, !dbg !407
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN5Fifo1IiE8deq__RDYEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !408, metadata !249), !dbg !409
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to i1 (%class.Fifo1*)***, !dbg !410
  %vtable = load i1 (%class.Fifo1*)**, i1 (%class.Fifo1*)*** %0, !dbg !410
  %vfn = getelementptr inbounds i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vtable, i64 8, !dbg !410
  %1 = load i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vfn, !dbg !410
  %call = call zeroext i1 %1(%class.Fifo1* %this1), !dbg !410
  ret i1 %call, !dbg !410
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN5Fifo1IiE3deqEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !411, metadata !249), !dbg !412
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !413
  store i8 0, i8* %full, align 1, !dbg !414
  ret void, !dbg !415
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN5Fifo1IiE10first__RDYEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !416, metadata !249), !dbg !417
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %0 = bitcast %class.Fifo1* %this1 to i1 (%class.Fifo1*)***, !dbg !418
  %vtable = load i1 (%class.Fifo1*)**, i1 (%class.Fifo1*)*** %0, !dbg !418
  %vfn = getelementptr inbounds i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vtable, i64 8, !dbg !418
  %1 = load i1 (%class.Fifo1*)*, i1 (%class.Fifo1*)** %vfn, !dbg !418
  %call = call zeroext i1 %1(%class.Fifo1* %this1), !dbg !418
  ret i1 %call, !dbg !418
}

; Function Attrs: nounwind
define linkonce_odr i32 @_ZN5Fifo1IiE5firstEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !419, metadata !249), !dbg !420
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %element = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 1, !dbg !421
  %0 = load i32, i32* %element, align 4, !dbg !421
  ret i32 %0, !dbg !422
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZNK5Fifo1IiE8notEmptyEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !423, metadata !249), !dbg !425
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !426
  %0 = load i8, i8* %full, align 1, !dbg !426
  %tobool = trunc i8 %0 to i1, !dbg !426
  ret i1 %tobool, !dbg !427
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZNK5Fifo1IiE7notFullEv(%class.Fifo1* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo1*, align 8
  store %class.Fifo1* %this, %class.Fifo1** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo1** %this.addr, metadata !428, metadata !249), !dbg !429
  %this1 = load %class.Fifo1*, %class.Fifo1** %this.addr
  %full = getelementptr inbounds %class.Fifo1, %class.Fifo1* %this1, i32 0, i32 2, !dbg !430
  %0 = load i8, i8* %full, align 1, !dbg !430
  %tobool = trunc i8 %0 to i1, !dbg !430
  %lnot = xor i1 %tobool, true, !dbg !431
  ret i1 %lnot, !dbg !432
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4FifoIiED2Ev(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !433, metadata !249), !dbg !434
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  ret void, !dbg !435
}

; Function Attrs: nounwind
define linkonce_odr void @_ZN4FifoIiED0Ev(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !436, metadata !249), !dbg !437
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  call void @_ZN4FifoIiED2Ev(%class.Fifo* %this1) #3, !dbg !438
  %0 = bitcast %class.Fifo* %this1 to i8*, !dbg !438
  call void @_ZdlPv(i8* %0) #7, !dbg !438
  ret void, !dbg !439
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4FifoIiE8enq__RDYEv(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !440, metadata !249), !dbg !441
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i1 (%class.Fifo*)***, !dbg !442
  %vtable = load i1 (%class.Fifo*)**, i1 (%class.Fifo*)*** %0, !dbg !442
  %vfn = getelementptr inbounds i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vtable, i64 9, !dbg !442
  %1 = load i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vfn, !dbg !442
  %call = call zeroext i1 %1(%class.Fifo* %this1), !dbg !442
  ret i1 %call, !dbg !442
}

declare void @__cxa_pure_virtual()

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4FifoIiE8deq__RDYEv(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !443, metadata !249), !dbg !444
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i1 (%class.Fifo*)***, !dbg !445
  %vtable = load i1 (%class.Fifo*)**, i1 (%class.Fifo*)*** %0, !dbg !445
  %vfn = getelementptr inbounds i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vtable, i64 8, !dbg !445
  %1 = load i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vfn, !dbg !445
  %call = call zeroext i1 %1(%class.Fifo* %this1), !dbg !445
  ret i1 %call, !dbg !445
}

; Function Attrs: nounwind
define linkonce_odr zeroext i1 @_ZN4FifoIiE10first__RDYEv(%class.Fifo* %this) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %class.Fifo*, align 8
  store %class.Fifo* %this, %class.Fifo** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.Fifo** %this.addr, metadata !446, metadata !249), !dbg !447
  %this1 = load %class.Fifo*, %class.Fifo** %this.addr
  %0 = bitcast %class.Fifo* %this1 to i1 (%class.Fifo*)***, !dbg !448
  %vtable = load i1 (%class.Fifo*)**, i1 (%class.Fifo*)*** %0, !dbg !448
  %vfn = getelementptr inbounds i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vtable, i64 8, !dbg !448
  %1 = load i1 (%class.Fifo*)*, i1 (%class.Fifo*)** %vfn, !dbg !448
  %call = call zeroext i1 %1(%class.Fifo* %this1), !dbg !448
  ret i1 %call, !dbg !448
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #5

; Function Attrs: nounwind
define internal void @_GLOBAL__sub_I_echo.cpp() #0 section ".text.startup" {
entry:
  call void @__cxx_global_var_init(), !dbg !449
  ret void
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nobuiltin "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { builtin }
attributes #7 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!245, !246}
!llvm.ident = !{!247}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 3.7.0 (git@github.com:cambridgehackers/clang.git 40b68b4c02b9d9e1e4138815747adf5589496240) (git@github.com:cambridgehackers/llvm 0776facd2ee120ca6286cb2109356e05e4085bfc)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !186, globals: !231, imports: !233)
!1 = !DIFile(filename: "echo.cpp", directory: "/home/jca/s/git/atomicc/examples/echo")
!2 = !{}
!3 = !{!4, !59, !60, !71, !82, !104, !105, !120, !156, !157, !158}
!4 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !6, file: !5, line: 75, size: 64, align: 64, elements: !9, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!5 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/exception_ptr.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!6 = !DINamespace(name: "__exception_ptr", scope: !7, file: !5, line: 53)
!7 = !DINamespace(name: "std", scope: null, file: !8, line: 184)
!8 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/c++config.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!9 = !{!10, !12, !16, !19, !20, !25, !26, !30, !35, !39, !43, !46, !47, !50, !54}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 77, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!12 = !DISubprogram(name: "exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 79, type: !13, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15, !11}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTSNSt15__exception_ptr13exception_ptrE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!16 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 81, type: !17, isLocal: false, isDefinition: false, scopeLine: 81, flags: DIFlagPrototyped, isOptimized: false)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !15}
!19 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 82, type: !17, isLocal: false, isDefinition: false, scopeLine: 82, flags: DIFlagPrototyped, isOptimized: false)
!20 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 84, type: !21, isLocal: false, isDefinition: false, scopeLine: 84, flags: DIFlagPrototyped, isOptimized: false)
!21 = !DISubroutineType(types: !22)
!22 = !{!11, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!24 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTSNSt15__exception_ptr13exception_ptrE")
!25 = !DISubprogram(name: "exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 90, type: !17, isLocal: false, isDefinition: false, scopeLine: 90, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!26 = !DISubprogram(name: "exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 92, type: !27, isLocal: false, isDefinition: false, scopeLine: 92, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !15, !29}
!29 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !24)
!30 = !DISubprogram(name: "exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 95, type: !31, isLocal: false, isDefinition: false, scopeLine: 95, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !15, !33}
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !7, file: !8, line: 190, baseType: !34)
!34 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!35 = !DISubprogram(name: "exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 99, type: !36, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !15, !38}
!38 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !"_ZTSNSt15__exception_ptr13exception_ptrE")
!39 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 112, type: !40, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !15, !29}
!42 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !"_ZTSNSt15__exception_ptr13exception_ptrE")
!43 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 116, type: !44, isLocal: false, isDefinition: false, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!44 = !DISubroutineType(types: !45)
!45 = !{!42, !15, !38}
!46 = !DISubprogram(name: "~exception_ptr", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 123, type: !17, isLocal: false, isDefinition: false, scopeLine: 123, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!47 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 126, type: !48, isLocal: false, isDefinition: false, scopeLine: 126, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !15, !42}
!50 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 138, type: !51, isLocal: false, isDefinition: false, scopeLine: 138, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !23}
!53 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!54 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !"_ZTSNSt15__exception_ptr13exception_ptrE", file: !5, line: 147, type: !55, isLocal: false, isDefinition: false, scopeLine: 147, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !23}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64, align: 64)
!58 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTSSt9type_info")
!59 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !7, file: !5, line: 47, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!60 = !DICompositeType(tag: DW_TAG_class_type, name: "EchoIndication", file: !1, line: 32, size: 8, align: 8, elements: !61, identifier: "_ZTS14EchoIndication")
!61 = !{!62, !66, !70}
!62 = !DISubprogram(name: "echo", linkageName: "_ZN14EchoIndication4echoEi", scope: !"_ZTS14EchoIndication", file: !1, line: 34, type: !63, isLocal: false, isDefinition: false, scopeLine: 34, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!63 = !DISubroutineType(types: !64)
!64 = !{null, !65}
!65 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!66 = !DISubprogram(name: "EchoIndication", scope: !"_ZTS14EchoIndication", file: !1, line: 35, type: !67, isLocal: false, isDefinition: false, scopeLine: 35, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!67 = !DISubroutineType(types: !68)
!68 = !{null, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS14EchoIndication", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!70 = !DISubprogram(name: "~EchoIndication", scope: !"_ZTS14EchoIndication", file: !1, line: 36, type: !67, isLocal: false, isDefinition: false, scopeLine: 36, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!71 = !DICompositeType(tag: DW_TAG_class_type, name: "EchoTest", file: !1, line: 67, size: 320, align: 64, elements: !72, identifier: "_ZTS8EchoTest")
!72 = !{!73, !74, !76, !77, !81}
!73 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS8EchoTest", baseType: !"_ZTS6Module", flags: DIFlagPublic)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !"_ZTS8EchoTest", file: !1, line: 69, baseType: !75, size: 64, align: 64, offset: 192, flags: DIFlagPublic)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Echo", size: 64, align: 64)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !"_ZTS8EchoTest", file: !1, line: 70, baseType: !65, size: 32, align: 32, offset: 256, flags: DIFlagPublic)
!77 = !DISubprogram(name: "EchoTest", scope: !"_ZTS8EchoTest", file: !1, line: 72, type: !78, isLocal: false, isDefinition: false, scopeLine: 72, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!78 = !DISubroutineType(types: !79)
!79 = !{null, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS8EchoTest", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!81 = !DISubprogram(name: "~EchoTest", scope: !"_ZTS8EchoTest", file: !1, line: 78, type: !78, isLocal: false, isDefinition: false, scopeLine: 78, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!82 = !DICompositeType(tag: DW_TAG_class_type, name: "Module", file: !83, line: 47, size: 192, align: 64, elements: !84, identifier: "_ZTS6Module")
!83 = !DIFile(filename: "../../cpp/atomicc.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!84 = !{!85, !87, !89, !93, !94, !98, !101}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "rfirst", scope: !"_ZTS6Module", file: !83, line: 73, baseType: !86, size: 64, align: 64, flags: DIFlagPublic)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Rule", size: 64, align: 64)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !"_ZTS6Module", file: !83, line: 74, baseType: !88, size: 64, align: 64, offset: 64, flags: DIFlagPublic)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS6Module", size: 64, align: 64)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !"_ZTS6Module", file: !83, line: 76, baseType: !90, size: 64, align: 64, offset: 128, flags: DIFlagPublic)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !91, line: 62, baseType: !92)
!91 = !DIFile(filename: "/scratch/jca/git/llvm/build/Debug+Asserts/bin/../lib/clang/3.7.0/include/stddef.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!92 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "first", scope: !"_ZTS6Module", file: !83, line: 77, baseType: !88, flags: DIFlagPublic | DIFlagStaticMember)
!94 = !DISubprogram(name: "Module", scope: !"_ZTS6Module", file: !83, line: 50, type: !95, isLocal: false, isDefinition: false, scopeLine: 50, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!95 = !DISubroutineType(types: !96)
!96 = !{null, !97, !90}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS6Module", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!98 = !DISubprogram(name: "addRule", linkageName: "_ZN6Module7addRuleEP4Rule", scope: !"_ZTS6Module", file: !83, line: 57, type: !99, isLocal: false, isDefinition: false, scopeLine: 57, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!99 = !DISubroutineType(types: !100)
!100 = !{null, !97, !86}
!101 = !DISubprogram(name: "run", linkageName: "_ZN6Module3runEv", scope: !"_ZTS6Module", file: !83, line: 62, type: !102, isLocal: false, isDefinition: false, scopeLine: 62, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!102 = !DISubroutineType(types: !103)
!103 = !{null, !97}
!104 = !DICompositeType(tag: DW_TAG_class_type, name: "Rule", file: !83, line: 37, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS4Rule")
!105 = !DICompositeType(tag: DW_TAG_class_type, name: "Echo", file: !1, line: 39, size: 384, align: 64, elements: !106, identifier: "_ZTS4Echo")
!106 = !{!107, !108, !110, !112, !113, !117}
!107 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS4Echo", baseType: !"_ZTS6Module", flags: DIFlagPublic)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "fifo", scope: !"_ZTS4Echo", file: !1, line: 41, baseType: !109, size: 64, align: 64, offset: 192, flags: DIFlagPublic)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4FifoIiE", size: 64, align: 64)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "ind", scope: !"_ZTS4Echo", file: !1, line: 42, baseType: !111, size: 64, align: 64, offset: 256, flags: DIFlagPublic)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS14EchoIndication", size: 64, align: 64)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "pipetemp", scope: !"_ZTS4Echo", file: !1, line: 43, baseType: !65, size: 32, align: 32, offset: 320, flags: DIFlagPublic)
!113 = !DISubprogram(name: "Echo", scope: !"_ZTS4Echo", file: !1, line: 45, type: !114, isLocal: false, isDefinition: false, scopeLine: 45, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!114 = !DISubroutineType(types: !115)
!115 = !{null, !116, !111}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4Echo", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!117 = !DISubprogram(name: "~Echo", scope: !"_ZTS4Echo", file: !1, line: 54, type: !118, isLocal: false, isDefinition: false, scopeLine: 54, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!118 = !DISubroutineType(types: !119)
!119 = !{null, !116}
!120 = !DICompositeType(tag: DW_TAG_class_type, name: "Fifo<int>", file: !121, line: 8, size: 256, align: 64, elements: !122, vtableHolder: !"_ZTS4FifoIiE", templateParams: !154, identifier: "_ZTS4FifoIiE")
!121 = !DIFile(filename: "../../cpp/fifo.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!122 = !{!123, !124, !129, !133, !136, !139, !142, !143, !144, !145, !148, !153}
!123 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS4FifoIiE", baseType: !"_ZTS6Module", offset: 64, flags: DIFlagPublic)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$Fifo", scope: !121, file: !121, baseType: !125, size: 64, flags: DIFlagArtificial)
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !126, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !127, size: 64)
!127 = !DISubroutineType(types: !128)
!128 = !{!65}
!129 = !DISubprogram(name: "Fifo", scope: !"_ZTS4FifoIiE", file: !121, line: 10, type: !130, isLocal: false, isDefinition: false, scopeLine: 10, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!130 = !DISubroutineType(types: !131)
!131 = !{null, !132, !90}
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS4FifoIiE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!133 = !DISubprogram(name: "~Fifo", scope: !"_ZTS4FifoIiE", file: !121, line: 11, type: !134, isLocal: false, isDefinition: false, scopeLine: 11, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!134 = !DISubroutineType(types: !135)
!135 = !{null, !132}
!136 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN4FifoIiE8enq__RDYEv", scope: !"_ZTS4FifoIiE", file: !121, line: 12, type: !137, isLocal: false, isDefinition: false, scopeLine: 12, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!137 = !DISubroutineType(types: !138)
!138 = !{!53, !132}
!139 = !DISubprogram(name: "enq", linkageName: "_ZN4FifoIiE3enqEi", scope: !"_ZTS4FifoIiE", file: !121, line: 12, type: !140, isLocal: false, isDefinition: false, scopeLine: 12, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 3, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!140 = !DISubroutineType(types: !141)
!141 = !{null, !132, !65}
!142 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN4FifoIiE8deq__RDYEv", scope: !"_ZTS4FifoIiE", file: !121, line: 13, type: !137, isLocal: false, isDefinition: false, scopeLine: 13, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 4, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!143 = !DISubprogram(name: "deq", linkageName: "_ZN4FifoIiE3deqEv", scope: !"_ZTS4FifoIiE", file: !121, line: 13, type: !134, isLocal: false, isDefinition: false, scopeLine: 13, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 5, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!144 = !DISubprogram(name: "first__RDY", linkageName: "_ZN4FifoIiE10first__RDYEv", scope: !"_ZTS4FifoIiE", file: !121, line: 14, type: !137, isLocal: false, isDefinition: false, scopeLine: 14, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 6, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!145 = !DISubprogram(name: "first", linkageName: "_ZN4FifoIiE5firstEv", scope: !"_ZTS4FifoIiE", file: !121, line: 14, type: !146, isLocal: false, isDefinition: false, scopeLine: 14, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 7, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!146 = !DISubroutineType(types: !147)
!147 = !{!65, !132}
!148 = !DISubprogram(name: "notEmpty", linkageName: "_ZNK4FifoIiE8notEmptyEv", scope: !"_ZTS4FifoIiE", file: !121, line: 15, type: !149, isLocal: false, isDefinition: false, scopeLine: 15, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 8, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!149 = !DISubroutineType(types: !150)
!150 = !{!53, !151}
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!152 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTS4FifoIiE")
!153 = !DISubprogram(name: "notFull", linkageName: "_ZNK4FifoIiE7notFullEv", scope: !"_ZTS4FifoIiE", file: !121, line: 16, type: !149, isLocal: false, isDefinition: false, scopeLine: 16, containingType: !"_ZTS4FifoIiE", virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 9, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!154 = !{!155}
!155 = !DITemplateTypeParameter(name: "T", type: !65)
!156 = !DICompositeType(tag: DW_TAG_structure_type, name: "__block_descriptor", file: !1, line: 74, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS18__block_descriptor")
!157 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!158 = !DICompositeType(tag: DW_TAG_class_type, name: "Fifo1<int>", file: !121, line: 20, size: 320, align: 64, elements: !159, vtableHolder: !"_ZTS4FifoIiE", templateParams: !154, identifier: "_ZTS5Fifo1IiE")
!159 = !{!160, !161, !162, !163, !167, !170, !171, !174, !175, !178, !179, !180, !185}
!160 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !"_ZTS5Fifo1IiE", baseType: !"_ZTS4FifoIiE", flags: DIFlagPublic)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "element", scope: !"_ZTS5Fifo1IiE", file: !121, line: 23, baseType: !65, size: 32, align: 32, offset: 256, flags: DIFlagPublic)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "full", scope: !"_ZTS5Fifo1IiE", file: !121, line: 24, baseType: !53, size: 8, align: 8, offset: 288, flags: DIFlagPublic)
!163 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN5Fifo1IiE8enq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 26, type: !164, isLocal: false, isDefinition: false, scopeLine: 26, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!164 = !DISubroutineType(types: !165)
!165 = !{!53, !166}
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS5Fifo1IiE", size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!167 = !DISubprogram(name: "enq", linkageName: "_ZN5Fifo1IiE3enqEi", scope: !"_ZTS5Fifo1IiE", file: !121, line: 26, type: !168, isLocal: false, isDefinition: false, scopeLine: 26, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 3, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!168 = !DISubroutineType(types: !169)
!169 = !{null, !166, !65}
!170 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN5Fifo1IiE8deq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 30, type: !164, isLocal: false, isDefinition: false, scopeLine: 30, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 4, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!171 = !DISubprogram(name: "deq", linkageName: "_ZN5Fifo1IiE3deqEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 30, type: !172, isLocal: false, isDefinition: false, scopeLine: 30, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 5, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!172 = !DISubroutineType(types: !173)
!173 = !{null, !166}
!174 = !DISubprogram(name: "first__RDY", linkageName: "_ZN5Fifo1IiE10first__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 33, type: !164, isLocal: false, isDefinition: false, scopeLine: 33, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 6, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!175 = !DISubprogram(name: "first", linkageName: "_ZN5Fifo1IiE5firstEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 33, type: !176, isLocal: false, isDefinition: false, scopeLine: 33, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 7, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!176 = !DISubroutineType(types: !177)
!177 = !{!65, !166}
!178 = !DISubprogram(name: "Fifo1", scope: !"_ZTS5Fifo1IiE", file: !121, line: 36, type: !172, isLocal: false, isDefinition: false, scopeLine: 36, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!179 = !DISubprogram(name: "~Fifo1", scope: !"_ZTS5Fifo1IiE", file: !121, line: 40, type: !172, isLocal: false, isDefinition: false, scopeLine: 40, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!180 = !DISubprogram(name: "notEmpty", linkageName: "_ZNK5Fifo1IiE8notEmptyEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 41, type: !181, isLocal: false, isDefinition: false, scopeLine: 41, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 8, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!53, !183}
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!184 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !"_ZTS5Fifo1IiE")
!185 = !DISubprogram(name: "notFull", linkageName: "_ZNK5Fifo1IiE7notFullEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 42, type: !181, isLocal: false, isDefinition: false, scopeLine: 42, containingType: !"_ZTS5Fifo1IiE", virtuality: DW_VIRTUALITY_virtual, virtualIndex: 9, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!186 = !{!187, !188, !191, !192, !199, !200, !203, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229}
!187 = !DISubprogram(name: "echo", linkageName: "_ZN14EchoIndication4echoEi", scope: !"_ZTS14EchoIndication", file: !1, line: 61, type: !63, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, function: void (i32)* @_ZN14EchoIndication4echoEi, declaration: !62, variables: !2)
!188 = !DISubprogram(name: "__cxx_global_var_init", scope: !1, file: !1, line: 81, type: !189, isLocal: true, isDefinition: true, scopeLine: 81, flags: DIFlagPrototyped, isOptimized: false, function: void ()* @__cxx_global_var_init, variables: !2)
!189 = !DISubroutineType(types: !190)
!190 = !{null}
!191 = !DISubprogram(name: "__dtor_echoTest", scope: !1, file: !1, line: 81, type: !189, isLocal: true, isDefinition: true, scopeLine: 81, flags: DIFlagPrototyped, isOptimized: false, function: void ()* @__dtor_echoTest, variables: !2)
!192 = !DISubprogram(name: "main", scope: !1, file: !1, line: 83, type: !193, isLocal: false, isDefinition: true, scopeLine: 84, flags: DIFlagPrototyped, isOptimized: false, function: i32 (i32, i8**)* @main, variables: !2)
!193 = !DISubroutineType(types: !194)
!194 = !{!65, !65, !195}
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64, align: 64)
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !197, size: 64, align: 64)
!197 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !198)
!198 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!199 = !DISubprogram(name: "EchoTest", linkageName: "_ZN8EchoTestC2Ev", scope: !"_ZTS8EchoTest", file: !1, line: 72, type: !78, isLocal: false, isDefinition: true, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.EchoTest*)* @_ZN8EchoTestC2Ev, declaration: !77, variables: !2)
!200 = !DISubprogram(name: "___ZN8EchoTestC2Ev_block_invoke", scope: !1, file: !1, line: 74, type: !201, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, function: i1 (i8*)* @___ZN8EchoTestC2Ev_block_invoke, variables: !2)
!201 = !DISubroutineType(types: !202)
!202 = !{!53, !11}
!203 = !DISubprogram(name: "___ZN8EchoTestC2Ev_block_invoke_2", scope: !1, file: !1, line: 74, type: !204, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, function: void (i8*)* @___ZN8EchoTestC2Ev_block_invoke_2, variables: !2)
!204 = !DISubroutineType(types: !205)
!205 = !{null, !11}
!206 = !DISubprogram(name: "Module", linkageName: "_ZN6ModuleC2Em", scope: !"_ZTS6Module", file: !83, line: 50, type: !95, isLocal: false, isDefinition: true, scopeLine: 50, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Module*, i64)* @_ZN6ModuleC2Em, declaration: !94, variables: !2)
!207 = !DISubprogram(name: "EchoIndication", linkageName: "_ZN14EchoIndicationC2Ev", scope: !"_ZTS14EchoIndication", file: !1, line: 35, type: !67, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.EchoIndication*)* @_ZN14EchoIndicationC2Ev, declaration: !66, variables: !2)
!208 = !DISubprogram(name: "Echo", linkageName: "_ZN4EchoC2EP14EchoIndication", scope: !"_ZTS4Echo", file: !1, line: 45, type: !114, isLocal: false, isDefinition: true, scopeLine: 45, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Echo*, %class.EchoIndication*)* @_ZN4EchoC2EP14EchoIndication, declaration: !113, variables: !2)
!209 = !DISubprogram(name: "___ZN4EchoC2EP14EchoIndication_block_invoke", scope: !1, file: !1, line: 47, type: !201, isLocal: true, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, function: i1 (i8*)* @___ZN4EchoC2EP14EchoIndication_block_invoke, variables: !2)
!210 = !DISubprogram(name: "___ZN4EchoC2EP14EchoIndication_block_invoke_2", scope: !1, file: !1, line: 47, type: !204, isLocal: true, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, function: void (i8*)* @___ZN4EchoC2EP14EchoIndication_block_invoke_2, variables: !2)
!211 = !DISubprogram(name: "Fifo1", linkageName: "_ZN5Fifo1IiEC2Ev", scope: !"_ZTS5Fifo1IiE", file: !121, line: 36, type: !172, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiEC2Ev, declaration: !178, variables: !2)
!212 = !DISubprogram(name: "Fifo", linkageName: "_ZN4FifoIiEC2Em", scope: !"_ZTS4FifoIiE", file: !121, line: 10, type: !130, isLocal: false, isDefinition: true, scopeLine: 10, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo*, i64)* @_ZN4FifoIiEC2Em, declaration: !129, variables: !2)
!213 = !DISubprogram(name: "~Fifo", linkageName: "_ZN4FifoIiED2Ev", scope: !"_ZTS4FifoIiE", file: !121, line: 11, type: !134, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo*)* @_ZN4FifoIiED2Ev, declaration: !133, variables: !2)
!214 = !DISubprogram(name: "~Fifo", linkageName: "_ZN4FifoIiED0Ev", scope: !"_ZTS4FifoIiE", file: !121, line: 11, type: !134, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo*)* @_ZN4FifoIiED0Ev, declaration: !133, variables: !2)
!215 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN4FifoIiE8enq__RDYEv", scope: !"_ZTS4FifoIiE", file: !121, line: 12, type: !137, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo*)* @_ZN4FifoIiE8enq__RDYEv, declaration: !136, variables: !2)
!216 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN4FifoIiE8deq__RDYEv", scope: !"_ZTS4FifoIiE", file: !121, line: 13, type: !137, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo*)* @_ZN4FifoIiE8deq__RDYEv, declaration: !142, variables: !2)
!217 = !DISubprogram(name: "first__RDY", linkageName: "_ZN4FifoIiE10first__RDYEv", scope: !"_ZTS4FifoIiE", file: !121, line: 14, type: !137, isLocal: false, isDefinition: true, scopeLine: 14, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo*)* @_ZN4FifoIiE10first__RDYEv, declaration: !144, variables: !2)
!218 = !DISubprogram(name: "~Fifo1", linkageName: "_ZN5Fifo1IiED2Ev", scope: !"_ZTS5Fifo1IiE", file: !121, line: 40, type: !172, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiED2Ev, declaration: !179, variables: !2)
!219 = !DISubprogram(name: "~Fifo1", linkageName: "_ZN5Fifo1IiED0Ev", scope: !"_ZTS5Fifo1IiE", file: !121, line: 40, type: !172, isLocal: false, isDefinition: true, scopeLine: 40, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiED0Ev, declaration: !179, variables: !2)
!220 = !DISubprogram(name: "enq__RDY", linkageName: "_ZN5Fifo1IiE8enq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 26, type: !164, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZN5Fifo1IiE8enq__RDYEv, declaration: !163, variables: !2)
!221 = !DISubprogram(name: "enq", linkageName: "_ZN5Fifo1IiE3enqEi", scope: !"_ZTS5Fifo1IiE", file: !121, line: 26, type: !168, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*, i32)* @_ZN5Fifo1IiE3enqEi, declaration: !167, variables: !2)
!222 = !DISubprogram(name: "deq__RDY", linkageName: "_ZN5Fifo1IiE8deq__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 30, type: !164, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZN5Fifo1IiE8deq__RDYEv, declaration: !170, variables: !2)
!223 = !DISubprogram(name: "deq", linkageName: "_ZN5Fifo1IiE3deqEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 30, type: !172, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.Fifo1*)* @_ZN5Fifo1IiE3deqEv, declaration: !171, variables: !2)
!224 = !DISubprogram(name: "first__RDY", linkageName: "_ZN5Fifo1IiE10first__RDYEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 33, type: !164, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZN5Fifo1IiE10first__RDYEv, declaration: !174, variables: !2)
!225 = !DISubprogram(name: "first", linkageName: "_ZN5Fifo1IiE5firstEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 33, type: !176, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, function: i32 (%class.Fifo1*)* @_ZN5Fifo1IiE5firstEv, declaration: !175, variables: !2)
!226 = !DISubprogram(name: "notEmpty", linkageName: "_ZNK5Fifo1IiE8notEmptyEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 41, type: !181, isLocal: false, isDefinition: true, scopeLine: 41, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZNK5Fifo1IiE8notEmptyEv, declaration: !180, variables: !2)
!227 = !DISubprogram(name: "notFull", linkageName: "_ZNK5Fifo1IiE7notFullEv", scope: !"_ZTS5Fifo1IiE", file: !121, line: 42, type: !181, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, function: i1 (%class.Fifo1*)* @_ZNK5Fifo1IiE7notFullEv, declaration: !185, variables: !2)
!228 = !DISubprogram(name: "~EchoTest", linkageName: "_ZN8EchoTestD2Ev", scope: !"_ZTS8EchoTest", file: !1, line: 78, type: !78, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, function: void (%class.EchoTest*)* @_ZN8EchoTestD2Ev, declaration: !81, variables: !2)
!229 = !DISubprogram(linkageName: "_GLOBAL__sub_I_echo.cpp", scope: !1, file: !1, type: !230, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, function: void ()* @_GLOBAL__sub_I_echo.cpp, variables: !2)
!230 = !DISubroutineType(types: !2)
!231 = !{!232}
!232 = !DIGlobalVariable(name: "echoTest", scope: !0, file: !1, line: 81, type: !"_ZTS8EchoTest", isLocal: false, isDefinition: true, variable: %class.EchoTest* @echoTest)
!233 = !{!234, !238, !239, !243}
!234 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !235, entity: !237, line: 56)
!235 = !DINamespace(name: "__gnu_debug", scope: null, file: !236, line: 54)
!236 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/debug/debug.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!237 = !DINamespace(name: "__debug", scope: !7, file: !236, line: 48)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !7, entity: !"_ZTSNSt15__exception_ptr13exception_ptrE", line: 58)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !240, entity: !242, line: 44)
!240 = !DINamespace(name: "__gnu_cxx", scope: null, file: !241, line: 68)
!241 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/jca/s/git/atomicc/examples/echo")
!242 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !7, file: !8, line: 186, baseType: !92)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !240, entity: !244, line: 45)
!244 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !7, file: !8, line: 187, baseType: !157)
!245 = !{i32 2, !"Dwarf Version", i32 4}
!246 = !{i32 2, !"Debug Info Version", i32 3}
!247 = !{!"clang version 3.7.0 (git@github.com:cambridgehackers/clang.git 40b68b4c02b9d9e1e4138815747adf5589496240) (git@github.com:cambridgehackers/llvm 0776facd2ee120ca6286cb2109356e05e4085bfc)"}
!248 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "v", arg: 1, scope: !187, file: !1, line: 61, type: !65)
!249 = !DIExpression()
!250 = !DILocation(line: 61, column: 31, scope: !187)
!251 = !DILocation(line: 63, column: 35, scope: !187)
!252 = !DILocation(line: 63, column: 5, scope: !187)
!253 = !DILocation(line: 64, column: 23, scope: !187)
!254 = !DILocation(line: 65, column: 1, scope: !187)
!255 = !DILocation(line: 81, column: 10, scope: !188)
!256 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !199, type: !257, flags: DIFlagArtificial | DIFlagObjectPointer)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS8EchoTest", size: 64, align: 64)
!258 = !DILocation(line: 0, scope: !199)
!259 = !DILocation(line: 72, column: 80, scope: !199)
!260 = !DILocation(line: 72, column: 15, scope: !199)
!261 = !DILocation(line: 72, column: 37, scope: !199)
!262 = !DILocation(line: 72, column: 42, scope: !199)
!263 = !DILocation(line: 72, column: 51, scope: !199)
!264 = !DILocation(line: 72, column: 55, scope: !199)
!265 = !DILocation(line: 72, column: 46, scope: !199)
!266 = !DILocation(line: 72, column: 75, scope: !199)
!267 = !DILocation(line: 73, column: 7, scope: !268)
!268 = distinct !DILexicalBlock(scope: !199, file: !1, line: 72, column: 80)
!269 = !DILocation(line: 74, column: 7, scope: !268)
!270 = !DILocation(line: 77, column: 3, scope: !199)
!271 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !228, type: !257, flags: DIFlagArtificial | DIFlagObjectPointer)
!272 = !DILocation(line: 0, scope: !228)
!273 = !DILocation(line: 78, column: 16, scope: !228)
!274 = !DILocation(line: 81, column: 10, scope: !191)
!275 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "argc", arg: 1, scope: !192, file: !1, line: 83, type: !65)
!276 = !DILocation(line: 83, column: 14, scope: !192)
!277 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "argv", arg: 2, scope: !192, file: !1, line: 83, type: !195)
!278 = !DILocation(line: 83, column: 32, scope: !192)
!279 = !DILocation(line: 85, column: 59, scope: !192)
!280 = !DILocation(line: 85, column: 3, scope: !192)
!281 = !DILocation(line: 86, column: 7, scope: !282)
!282 = distinct !DILexicalBlock(scope: !192, file: !1, line: 86, column: 7)
!283 = !DILocation(line: 86, column: 12, scope: !282)
!284 = !DILocation(line: 86, column: 7, scope: !192)
!285 = !DILocation(line: 87, column: 7, scope: !282)
!286 = !DILocation(line: 88, column: 3, scope: !192)
!287 = !DILocation(line: 89, column: 3, scope: !192)
!288 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !206, type: !88, flags: DIFlagArtificial | DIFlagObjectPointer)
!289 = !DILocation(line: 0, scope: !206)
!290 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "size", arg: 2, scope: !206, file: !83, line: 50, type: !90)
!291 = !DILocation(line: 50, column: 17, scope: !206)
!292 = !DILocation(line: 50, column: 24, scope: !206)
!293 = !DILocation(line: 50, column: 38, scope: !206)
!294 = !DILocation(line: 50, column: 43, scope: !206)
!295 = !DILocation(line: 50, column: 51, scope: !206)
!296 = !DILocation(line: 50, column: 56, scope: !206)
!297 = !DILocation(line: 51, column: 96, scope: !298)
!298 = distinct !DILexicalBlock(scope: !206, file: !83, line: 50, column: 62)
!299 = !DILocation(line: 51, column: 115, scope: !298)
!300 = !DILocation(line: 51, column: 6, scope: !298)
!301 = !DILocation(line: 52, column: 12, scope: !298)
!302 = !DILocation(line: 56, column: 3, scope: !206)
!303 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !207, type: !111, flags: DIFlagArtificial | DIFlagObjectPointer)
!304 = !DILocation(line: 0, scope: !207)
!305 = !DILocation(line: 35, column: 21, scope: !207)
!306 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !208, type: !75, flags: DIFlagArtificial | DIFlagObjectPointer)
!307 = !DILocation(line: 0, scope: !208)
!308 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "ind", arg: 2, scope: !208, file: !1, line: 45, type: !111)
!309 = !DILocation(line: 45, column: 24, scope: !208)
!310 = !DILocation(line: 45, column: 86, scope: !208)
!311 = !DILocation(line: 45, column: 31, scope: !208)
!312 = !DILocation(line: 45, column: 53, scope: !208)
!313 = !DILocation(line: 45, column: 58, scope: !208)
!314 = !DILocation(line: 45, column: 62, scope: !208)
!315 = !DILocation(line: 45, column: 77, scope: !208)
!316 = !DILocation(line: 45, column: 81, scope: !208)
!317 = !DILocation(line: 46, column: 83, scope: !318)
!318 = distinct !DILexicalBlock(scope: !208, file: !1, line: 45, column: 86)
!319 = !DILocation(line: 46, column: 5, scope: !318)
!320 = !DILocation(line: 47, column: 5, scope: !318)
!321 = !DILocation(line: 53, column: 3, scope: !208)
!322 = !DILocalVariable(tag: DW_TAG_arg_variable, name: ".block_descriptor", arg: 1, scope: !200, file: !1, line: 74, type: !323, flags: DIFlagArtificial)
!323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !324, size: 64)
!324 = !DICompositeType(tag: DW_TAG_structure_type, name: "__block_literal_1", scope: !1, file: !1, line: 74, size: 256, align: 64, elements: !325)
!325 = !{!326, !327, !328, !329, !333}
!326 = !DIDerivedType(tag: DW_TAG_member, name: "__isa", scope: !1, file: !1, line: 74, baseType: !11, size: 64, align: 64, flags: DIFlagPublic)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "__flags", scope: !1, file: !1, line: 74, baseType: !65, size: 32, align: 32, offset: 64, flags: DIFlagPublic)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "__reserved", scope: !1, file: !1, line: 74, baseType: !65, size: 32, align: 32, offset: 96, flags: DIFlagPublic)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "__FuncPtr", scope: !1, file: !1, line: 74, baseType: !330, size: 64, align: 64, offset: 128, flags: DIFlagPublic)
!330 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !331, size: 64, align: 64)
!331 = !DISubroutineType(types: !332)
!332 = !{!53}
!333 = !DIDerivedType(tag: DW_TAG_member, name: "__descriptor", scope: !1, file: !1, line: 74, baseType: !334, size: 64, align: 64, offset: 192, flags: DIFlagPublic)
!334 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS18__block_descriptor", size: 64, align: 64)
!335 = !DILocation(line: 74, column: 7, scope: !200)
!336 = !DILocation(line: 74, column: 7, scope: !337)
!337 = distinct !DILexicalBlock(scope: !200, file: !1, line: 74, column: 7)
!338 = !DILocalVariable(tag: DW_TAG_arg_variable, name: ".block_descriptor", arg: 1, scope: !203, file: !1, line: 74, type: !339, flags: DIFlagArtificial)
!339 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !340, size: 64)
!340 = !DICompositeType(tag: DW_TAG_structure_type, name: "__block_literal_2", scope: !1, file: !1, line: 74, size: 320, align: 64, elements: !341)
!341 = !{!326, !327, !328, !342, !333, !344}
!342 = !DIDerivedType(tag: DW_TAG_member, name: "__FuncPtr", scope: !1, file: !1, line: 74, baseType: !343, size: 64, align: 64, offset: 128, flags: DIFlagPublic)
!343 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !189, size: 64, align: 64)
!344 = !DIDerivedType(tag: DW_TAG_member, name: "this", scope: !1, file: !1, line: 74, baseType: !257, size: 64, align: 64, offset: 256, flags: DIFlagPublic)
!345 = !DILocation(line: 74, column: 7, scope: !203)
!346 = !DILocation(line: 74, column: 7, scope: !347)
!347 = distinct !DILexicalBlock(scope: !203, file: !1, line: 74, column: 7)
!348 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !211, type: !349, flags: DIFlagArtificial | DIFlagObjectPointer)
!349 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !"_ZTS5Fifo1IiE", size: 64, align: 64)
!350 = !DILocation(line: 0, scope: !211)
!351 = !DILocation(line: 37, column: 17, scope: !211)
!352 = !DILocation(line: 36, column: 13, scope: !211)
!353 = !DILocation(line: 37, column: 5, scope: !211)
!354 = !DILocation(line: 38, column: 5, scope: !355)
!355 = distinct !DILexicalBlock(scope: !211, file: !121, line: 37, column: 17)
!356 = !DILocation(line: 39, column: 3, scope: !211)
!357 = !DILocalVariable(tag: DW_TAG_arg_variable, name: ".block_descriptor", arg: 1, scope: !209, file: !1, line: 47, type: !358, flags: DIFlagArtificial)
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !359, size: 64)
!359 = !DICompositeType(tag: DW_TAG_structure_type, name: "__block_literal_3", scope: !1, file: !1, line: 47, size: 256, align: 64, elements: !360)
!360 = !{!361, !362, !363, !364, !365}
!361 = !DIDerivedType(tag: DW_TAG_member, name: "__isa", scope: !1, file: !1, line: 47, baseType: !11, size: 64, align: 64, flags: DIFlagPublic)
!362 = !DIDerivedType(tag: DW_TAG_member, name: "__flags", scope: !1, file: !1, line: 47, baseType: !65, size: 32, align: 32, offset: 64, flags: DIFlagPublic)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "__reserved", scope: !1, file: !1, line: 47, baseType: !65, size: 32, align: 32, offset: 96, flags: DIFlagPublic)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "__FuncPtr", scope: !1, file: !1, line: 47, baseType: !330, size: 64, align: 64, offset: 128, flags: DIFlagPublic)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "__descriptor", scope: !1, file: !1, line: 47, baseType: !334, size: 64, align: 64, offset: 192, flags: DIFlagPublic)
!366 = !DILocation(line: 47, column: 5, scope: !209)
!367 = !DILocation(line: 47, column: 5, scope: !368)
!368 = distinct !DILexicalBlock(scope: !209, file: !1, line: 47, column: 5)
!369 = !DILocalVariable(tag: DW_TAG_arg_variable, name: ".block_descriptor", arg: 1, scope: !210, file: !1, line: 47, type: !370, flags: DIFlagArtificial)
!370 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !371, size: 64)
!371 = !DICompositeType(tag: DW_TAG_structure_type, name: "__block_literal_4", scope: !1, file: !1, line: 47, size: 320, align: 64, elements: !372)
!372 = !{!361, !362, !363, !373, !365, !374}
!373 = !DIDerivedType(tag: DW_TAG_member, name: "__FuncPtr", scope: !1, file: !1, line: 47, baseType: !343, size: 64, align: 64, offset: 128, flags: DIFlagPublic)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "this", scope: !1, file: !1, line: 47, baseType: !75, size: 64, align: 64, offset: 256, flags: DIFlagPublic)
!375 = !DILocation(line: 47, column: 5, scope: !210)
!376 = !DILocation(line: 47, column: 5, scope: !377)
!377 = distinct !DILexicalBlock(scope: !210, file: !1, line: 47, column: 5)
!378 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !212, type: !109, flags: DIFlagArtificial | DIFlagObjectPointer)
!379 = !DILocation(line: 0, scope: !212)
!380 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "size", arg: 2, scope: !212, file: !121, line: 10, type: !90)
!381 = !DILocation(line: 10, column: 15, scope: !212)
!382 = !DILocation(line: 10, column: 35, scope: !212)
!383 = !DILocation(line: 10, column: 29, scope: !212)
!384 = !DILocation(line: 10, column: 22, scope: !212)
!385 = !DILocation(line: 10, column: 36, scope: !212)
!386 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !218, type: !349, flags: DIFlagArtificial | DIFlagObjectPointer)
!387 = !DILocation(line: 0, scope: !218)
!388 = !DILocation(line: 40, column: 13, scope: !389)
!389 = distinct !DILexicalBlock(scope: !218, file: !121, line: 40, column: 12)
!390 = !DILocation(line: 40, column: 13, scope: !218)
!391 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !219, type: !349, flags: DIFlagArtificial | DIFlagObjectPointer)
!392 = !DILocation(line: 0, scope: !219)
!393 = !DILocation(line: 40, column: 12, scope: !219)
!394 = !DILocation(line: 40, column: 13, scope: !219)
!395 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !220, type: !349, flags: DIFlagArtificial | DIFlagObjectPointer)
!396 = !DILocation(line: 0, scope: !220)
!397 = !DILocation(line: 26, column: 3, scope: !220)
!398 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !221, type: !349, flags: DIFlagArtificial | DIFlagObjectPointer)
!399 = !DILocation(line: 0, scope: !221)
!400 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "v", arg: 2, scope: !221, file: !121, line: 26, type: !65)
!401 = !DILocation(line: 26, column: 3, scope: !221)
!402 = !DILocation(line: 27, column: 17, scope: !221)
!403 = !DILocation(line: 27, column: 7, scope: !221)
!404 = !DILocation(line: 27, column: 15, scope: !221)
!405 = !DILocation(line: 28, column: 7, scope: !221)
!406 = !DILocation(line: 28, column: 12, scope: !221)
!407 = !DILocation(line: 29, column: 5, scope: !221)
!408 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !222, type: !349, flags: DIFlagArtificial | DIFlagObjectPointer)
!409 = !DILocation(line: 0, scope: !222)
!410 = !DILocation(line: 30, column: 3, scope: !222)
!411 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !223, type: !349, flags: DIFlagArtificial | DIFlagObjectPointer)
!412 = !DILocation(line: 0, scope: !223)
!413 = !DILocation(line: 31, column: 7, scope: !223)
!414 = !DILocation(line: 31, column: 12, scope: !223)
!415 = !DILocation(line: 32, column: 5, scope: !223)
!416 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !224, type: !349, flags: DIFlagArtificial | DIFlagObjectPointer)
!417 = !DILocation(line: 0, scope: !224)
!418 = !DILocation(line: 33, column: 3, scope: !224)
!419 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !225, type: !349, flags: DIFlagArtificial | DIFlagObjectPointer)
!420 = !DILocation(line: 0, scope: !225)
!421 = !DILocation(line: 34, column: 12, scope: !225)
!422 = !DILocation(line: 34, column: 5, scope: !225)
!423 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !226, type: !424, flags: DIFlagArtificial | DIFlagObjectPointer)
!424 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64, align: 64)
!425 = !DILocation(line: 0, scope: !226)
!426 = !DILocation(line: 41, column: 34, scope: !226)
!427 = !DILocation(line: 41, column: 27, scope: !226)
!428 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !227, type: !424, flags: DIFlagArtificial | DIFlagObjectPointer)
!429 = !DILocation(line: 0, scope: !227)
!430 = !DILocation(line: 42, column: 34, scope: !227)
!431 = !DILocation(line: 42, column: 33, scope: !227)
!432 = !DILocation(line: 42, column: 26, scope: !227)
!433 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !213, type: !109, flags: DIFlagArtificial | DIFlagObjectPointer)
!434 = !DILocation(line: 0, scope: !213)
!435 = !DILocation(line: 11, column: 20, scope: !213)
!436 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !214, type: !109, flags: DIFlagArtificial | DIFlagObjectPointer)
!437 = !DILocation(line: 0, scope: !214)
!438 = !DILocation(line: 11, column: 19, scope: !214)
!439 = !DILocation(line: 11, column: 20, scope: !214)
!440 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !215, type: !109, flags: DIFlagArtificial | DIFlagObjectPointer)
!441 = !DILocation(line: 0, scope: !215)
!442 = !DILocation(line: 12, column: 3, scope: !215)
!443 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !216, type: !109, flags: DIFlagArtificial | DIFlagObjectPointer)
!444 = !DILocation(line: 0, scope: !216)
!445 = !DILocation(line: 13, column: 3, scope: !216)
!446 = !DILocalVariable(tag: DW_TAG_arg_variable, name: "this", arg: 1, scope: !217, type: !109, flags: DIFlagArtificial | DIFlagObjectPointer)
!447 = !DILocation(line: 0, scope: !217)
!448 = !DILocation(line: 14, column: 3, scope: !217)
!449 = !DILocation(line: 0, scope: !229)
