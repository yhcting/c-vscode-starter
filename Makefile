TARGET := a.out
OBJS := $(patsubst %.c,%.o,$(wildcard *.c))

CINCLUDES := \

CFLAGS := -g
CFLAGS += $(addprefix -I, $(CINCLUDES))
CFLAGS += $(addprefix -D, $(CDEFS))

#COFLAGS := -fPIC

LPATH :=
LPATH := $(addprefix -L,$(LPATH))

LDFLAGS := \
	-static \
	-Wl,--gc-sections \
	$(LPATH)

# Order is important

# Archive(.a) files
# ARCS :=

# Libraries
LIBS :=

LIBS := $(addprefix -l,$(LIBS))


all: $(TARGET)

$(TARGET): $(OBJS) $(ARCS)
	$(CC) -o $@  $(LDFLAGS) $^ $(LIBS)

%.o:  %.c
	$(CC) $(CFLAGS) $(COFLAGS) -c -o $@ $<

clean:
	-rm -rf $(OBJS) $(CPPOBJS) $(TARGET) $(DEPDIR)
