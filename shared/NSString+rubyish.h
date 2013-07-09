#import <Foundation/Foundation.h>

// Methods based off of Ruby 2.0.
// See NSMutableString+rubyish.h for mutation methods.
// When methods have a mutable and immutable method, the mutable method is named like 'delete', and
// the immutable version is 'deleted'.
@interface NSString(rubyish)
    // not implemented: ::new
    // not implemented: ::try_convert
    // not implemented: #%
    // not implemented: #*
    // not implemented: #+
    // not implemented: #<<
    // not implemented: #<=>
    // not implemented: #==
    // not implemented: #===
    // not implemented: #=~
    // not implemented: #[]
    // not implemented: #[]=
    // not implemented: #ascii_only?
    // not implemented: #b
    // not implemented: #bytes
    // not implemented: #bytesize
    // not implemented: #byteslice
    -(NSString*)capitalized; // #capitalize
    // not implemented: #capitalize!
    // not implemented: #casecmp
    // not implemented: #center
    // not implemented: #chars
    // not implemented: #chomp
    // not implemented: #chomp!
    // not implemented: #chop
    // not implemented: #chop!
    // not implemented: #chr
    // not implemented: #clear
    // not implemented: #codepoints
    // not implemented: #concat
    // not implemented: #count
    // not implemented: #crypt
    // not implemented: #delete
    // not implemented: #delete!
    -(NSString*)downcased; // #downcase
    // not implemented: #downcase!
    // not implemented: #dump
    // not implemented: #each_byte
    // not implemented: #each_char
    // not implemented: #each_codepoint
    // not implemented: #each_line
    -(BOOL)isEmpty; // #empty?
    // not implemented: #encode
    // not implemented: #encode!
    // not implemented: #encoding
    // not implemented: #end_with?
    // not implemented: #eql?
    // not implemented: #force_encoding
    // not implemented: #getbyte
    // not implemented: #gsub
    // not implemented: #gsub!
    // not implemented: #hash
    // not implemented: #hex
    -(BOOL)includes:(NSString*)string;// #include?
    // not implemented: #index
    // not implemented: #initialize_copy
    // not implemented: #insert
    // not implemented: #inspect
    // not implemented: #intern
    // not implemented: #length
    // not implemented: #lines
    // not implemented: #ljust
    // not implemented: #lstrip
    // not implemented: #lstrip!
    // not implemented: #match
    // not implemented: #next
    // not implemented: #next!
    // not implemented: #oct
    // not implemented: #ord
    // not implemented: #partition
    // not implemented: #prepend
    // not implemented: #replace
    // not implemented: #reverse
    // not implemented: #reverse!
    // not implemented: #rindex
    // not implemented: #rjust
    // not implemented: #rpartition
    // not implemented: #rstrip
    // not implemented: #rstrip!
    // not implemented: #scan
    // not implemented: #scrub
    // not implemented: #scrub!
    // not implemented: #setbyte
    -(NSUInteger)size; // #size
    // not implemented: #slice
    // not implemented: #slice!
    // not implemented: #split
    // not implemented: #squeeze
    // not implemented: #squeeze!
    // not implemented: #start_with?
    -(NSString*)stripped; // #strip
    // not implemented: #strip!
    // not implemented: #sub
    // not implemented: #sub!
    // not implemented: #succ
    // not implemented: #succ!
    // not implemented: #sum
    // not implemented: #swapcase
    // not implemented: #swapcase!
    // not implemented: #to_c
    // not implemented: #to_f
    // not implemented: #to_i
    // not implemented: #to_r
    // not implemented: #to_s
    // not implemented: #to_str
    // not implemented: #to_sym
    // not implemented: #tr
    // not implemented: #tr!
    // not implemented: #tr_s
    // not implemented: #tr_s!
    // not implemented: #unpack
    -(NSString*)upcased; // #upcase
    // not implemented: #upcase!
    // not implemented: #upto
    // not implemented: #valid_encoding?
@end
