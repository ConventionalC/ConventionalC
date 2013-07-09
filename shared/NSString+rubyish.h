#import <Foundation/Foundation.h>

// See NSMutableString+rubyish.h for mutation methods.
@interface NSString(rubyish)
    // Mutable:
    // not implemented: #capitalize!
    // not implemented: #chomp!
    // not implemented: #chop!
    // not implemented: #clear
    // not implemented: #delete!
    // not implemented: #encode!
    // not implemented: #downcase!
    // not implemented: #gsub!
    // not implemented: #insert
    // not implemented: #lstrip!
    // not implemented: #next!
    // not implemented: #prepend
    // not implemented: #reverse!
    // not implemented: #rstrip!
    // not implemented: #scrub!
    // not implemented: #slice!
    // not implemented: #squeeze!
    // not implemented: #strip!
    // not implemented: #sub!
    // not implemented: #succ!
    // not implemented: #swapcase!
    // not implemented: #tr!
    // not implemented: #tr_s!

    //::new, Use -copy
    // not implemented: ::try_convert
    // not implemented: #%
    // not implemented: #*
    // not implemented: #+
    // not implemented: #<<
    // not implemented: #<=>
    // #==, Use -isEqual:
    // not implemented: #===
    // not implemented: #=~
    // not implemented: #[]
    // not implemented: #[]=
    // not implemented: #ascii_only?
    // not implemented: #b
    -(const void *)bytes; // #bytes
    -(NSUInteger)bytesize; // #bytesize
    // not implemented: #byteslice
    -(NSString*)capitalized; // #capitalize
    -(NSComparisonResult)casecmp:(NSString*)with; // #casecmp
    // not implemented: #center
    // not implemented: #chars
    // not implemented: #chomp
    // not implemented: #chop
    -(NSString*)chr; // #chr
    // not implemented: #codepoints
    // not implemented: #concat
    // not implemented: #count
    // not implemented: #crypt
    // not implemented: #delete
    -(NSString*)downcased; // #downcase
    // not implemented: #dump
    -(void)eachByte:(void(^)(char b))block; // #each_byte
    -(void)eachChar:(void(^)(unichar c))block; // #each_char
    // not implemented: #each_codepoint
    -(void)eachLine:(void(^)(NSString *line))block; //#each_line
    // not implemented: #each_line(separator=$/) {|substr| block }
    -(BOOL)isEmpty; // #empty?
    // not implemented: #encode
    // not implemented: #encoding
    -(BOOL)endsWith:(NSString*)suffix; // #end_with?
    -(BOOL)endsWithAny:(NSArray*)suffixes; // #end_with?([suffixes]+)
    // not implemented: #eql?
    // not implemented: #force_encoding
    // not implemented: #getbyte
    // not implemented: #gsub
    // #hash, use -hash.
    // not implemented: #hex
    -(BOOL)includes:(NSString*)string;// #include?
    // not implemented: #index
    // not implemented: #initialize_copy
    // not implemented: #inspect
    // not implemented: #intern
    // #length, Use -length
    // not implemented: #lines
    // not implemented: #ljust
    -(NSString*)lstripped; // #lstrip
    // not implemented: #match
    // not implemented: #next
    // not implemented: #oct
    // not implemented: #ord
    // not implemented: #partition
    // not implemented: #replace
    -(NSString*)reversed; // #reverse
    // not implemented: #rindex
    // not implemented: #rjust
    // not implemented: #rpartition
    -(NSString*)rstripped; // #rstrip
    // not implemented: #scan
    // not implemented: #scrub
    // not implemented: #setbyte
    -(NSUInteger)size; // #size
    // not implemented: #slice
    // not implemented: #split
    // not implemented: #squeeze
    -(BOOL)startsWith:(NSString*)prefix;// #start_with?
    -(BOOL)startsWithAny:(NSArray*)prefixes;// start_with?([prefixes]+)
    -(NSString*)stripped; // #strip
    // not implemented: #sub
    // not implemented: #succ
    // not implemented: #sum
    -(NSString*)swapcased;// #swapcase
    // not implemented: #to_c
    // not implemented: #to_f
    // not implemented: #to_i
    // not implemented: #to_r
    // not implemented: #to_s
    // not implemented: #to_str
    // not implemented: #to_sym
    // not implemented: #tr
    // not implemented: #tr_s
    // not implemented: #unpack
    -(NSString*)upcased; // #upcase
    // not implemented: #upcase!
    // not implemented: #upto
    // not implemented: #valid_encoding?
@end
