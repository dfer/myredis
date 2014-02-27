# Прокси-класс - прослойка между классом Redis и программой
require 'redis'
require 'md5'

class MyRedis < Redis	
	def node(text)
		return case Integer('0x'+Digest::SHA1.hexdigest(text))%8
			when 0 : 0
			when 1 : 1
			when 2 : 2
			when 3 : 3
			when 4 : 4
			when 5 : 5
			when 6 : 6
			when 7 : 7
		end
	end
	
	# Изменные методы родительского класса
	def hget(text1, text2)
		return $r_new[self.node(text1)].hget text1, text2
	end
	
	def hmget(text1, *array)
		return $r_new[self.node(text1)].hmget text1, *array
	end
	
	def hset(text1, text2, text3)
		return $r_new[self.node(text1)].hset text1, text2, text3
	end
	
	def hmset(text1, *array)
		return $r_new[self.node(text1)].hmset text1, *array
	end
	
	def hgetall(text1)
		return $r_new[self.node(text1)].hgetall text1
	end
	
	def hincrby(text1, text2, text3)
		return $r_new[self.node(text1)].hincrby text1, text2, text3
	end
	
	def get(key)
		return $r_new[self.node(key)].get key
	end
	
	def del(key)
		return $r_new[self.node(key)].del key
	end
	
	def getbit(key, offset)
		return $r_new[self.node(key)].getbit key, offset
	end

	def getrange(key, start, stop)
		return $r_new[self.node(key)].getrange key, start, stop
	end
	
	def getset(key, value)
		return $r_new[self.node(key)].getset key, value
	end
		
	def append(key, value)
		return $r_new[self.node(key)].append key, value
	end
	
	def substr(key, start, stop)
		return $r_new[self.node(key)].substr key, start, stop
	end
	
	def strlen(key)
		return $r_new[self.node(key)].strlen key
	end
	
	def hdel(key, field)
		return $r_new[self.node(key)].hdel key, field
	end
	
	def hkeys(key)
		return $r_new[self.node(key)].hkeys key
	end
	
	def llen(key)
		return $r_new[self.node(key)].llen key
	end
	
	def lrange(key, start, stop)
		return $r_new[self.node(key)].lrange key, start, stop
	end
	
	def ltrim(key, start, stop)
		return $r_new[self.node(key)].ltrim key, start, stop
	end
	
	def lindex(key, index)
		return $r_new[self.node(key)].lindex key, index
	end
	
	def linsert(key, where, pivot, value)
		return $r_new[self.node(key)].linsert key, where, pivot, value
	end
	
	def lset(key, index, value)
		return $r_new[self.node(key)].lset key, index, value
	end
	
	def lrem(key, count, value)
		return $r_new[self.node(key)].lrem key, count, value
	end
	
	def rpush(key, value)
		return $r_new[self.node(key)].rpush key, value
	end
	
	def rpushx(key, value)
		return $r_new[self.node(key)].rpushx key, value
	end
	
	def lpush(key, value)
		return $r_new[self.node(key)].lpush key, value
	end
	
	def lpushx(key, value)
		return $r_new[self.node(key)].lpushx key, value
	end
	
	def rpop(key)
		return $r_new[self.node(key)].rpop key
	end
	
	def lpop(key)
		return $r_new[self.node(key)].lpop key
	end
	
	def smembers(key)
		return $r_new[self.node(key)].smembers key
	end
	
	def sismember(key, member)
		return $r_new[self.node(key)].sismember key, member
	end
	
	def sadd(key, value)
		return $r_new[self.node(key)].sadd key, value
	end
	
	def srem(key, value)
		return $r_new[self.node(key)].srem key, value
	end
	
	def spop(key)
		return $r_new[self.node(key)].spop key
	end
	
	def scard(key)
		return $r_new[self.node(key)].scard key
	end
	
	def srandmember(key)
		return $r_new[self.node(key)].srandmember key
	end
	
	def zadd(key, score, member)
		return $r_new[self.node(key)].zadd key, score, member
	end
	
	def zrank(key, member)
		return $r_new[self.node(key)].zrank key, member
	end
	
	def zrevrank(key, member)
		return $r_new[self.node(key)].zrevrank key, member
	end
	
	def zincrby(key, increment, member)
		return $r_new[self.node(key)].zincrby key, increment, member
	end
	
	def zcard(key)
		return $r_new[self.node(key)].zcard key
	end
	
	def zrange(key, start, stop, options = {})
		return $r_new[self.node(key)].zrange key, key, start, stop, options
	end
	
	def zrangebyscore(key, min, max, options = {})
		return $r_new[self.node(key)].zrangebyscore key, min, max, options
	end
	
	def zcount(key, start, stop)
		return $r_new[self.node(key)].zcount key, start, stop
	end
	
	def zrevrange(key, start, stop, options = {})
		return $r_new[self.node(key)].zrevrange key, start, stop, options
	end
	
	def zrevrangebyscore(key, max, min, options = {})
		return $r_new[self.node(key)].zrevrangebyscore key, max, min, options
	end
	
	def zremrangebyscore(key, min, max)
		return $r_new[self.node(key)].zremrangebyscore key, min, max
	end
	
	def zremrangebyrank(key, start, stop)
		return $r_new[self.node(key)].zremrangebyrank key, start, stop
	end
	
	def zscore(key, member)
		return $r_new[self.node(key)].zscore key, member
	end
	
	def zrem(key, member)
		return $r_new[self.node(key)].zrem key, member
	end
	
	def setnx(key, value)
		return $r_new[self.node(key)].setnx key, value
	end
	
	def expire(key, seconds)
		return $r_new[self.node(key)].expire key, seconds
	end
	
	def persist(key)
		return $r_new[self.node(key)].persist key
	end
	
	def ttl(key)
		return $r_new[self.node(key)].ttl key
	end
	
	def expireat(key, unix_time)
		return $r_new[self.node(key)].expireat key, unix_time
	end
	
	def hsetnx(key, field, value)
		return $r_new[self.node(key)].hsetnx key, field, value
	end
	
	def hlen(key)
		return $r_new[self.node(key)].hlen key
	end
	
	def hvals(key)
		return $r_new[self.node(key)].hvals key
	end
	
	def hincrby(key, field, increment)
		return $r_new[self.node(key)].hincrby key, field, increment
	end
	
	def hexists(key, field)
		return $r_new[self.node(key)].hexists key, field
	end
	
	def set(key, value)
		return $r_new[self.node(key)].set key, value
	end
		
	def setbit(key, offset, value)
		return $r_new[self.node(key)].setbit key, offset, value
	end
	
	def setex(key, ttl, value)
		return $r_new[self.node(key)].setex key, ttl, value
	end
	
	def setrange(key, offset, value)
		return $r_new[self.node(key)].setrange key, offset, value
	end
	
	def sort(key, options = {})
		return $r_new[self.node(key)].sort key, options
	end
	
	def incr(key)
		return $r_new[self.node(key)].incr key
	end
	
	def incrby(key, increment)
		return $r_new[self.node(key)].incrby key, increment
	end
	
	def decr(key)
		return $r_new[self.node(key)].decr key
	end
	
	def decrby(key, decrement)
		return $r_new[self.node(key)].decrby key, decrement
	end
end