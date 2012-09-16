class Chef
  class Log
    def self.puts(*a)
      self.<< "\n" if a.empty?
      a.each {|m| self.<< m; self.<< "\n"}
    end

    def self.print(*a)
      a.each {|m| self.<< m}
    end
  end
end
