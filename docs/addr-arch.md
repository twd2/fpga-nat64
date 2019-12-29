# 地址映射说明

## 三类IPv6地址

* 从IPv4地址直接转换来的IPv6地址（`ETH_IPV4_CONVERTED_PREFIX`，固定前缀长度96）：在RFC中被称为IPv4-converted地址，表示一个IPv4主机；
* 可以直接转换为IPv4地址的IPv6地址（`ETH_IPV4_TRANSLATABLE_PREFIX`，固定前缀长度96）：在RFC中被称为IPv4-translatable地址，表示一类特殊的IPv6主机，该类主机的地址可以直接转换为IPv4地址；
* 其他普通IPv6地址，在访问IPv4主机时会从IPv4地址池中分配一个临时的IPv4地址。

## 三类IPv4地址

* 从IPv6地址直接转换来的IPv4地址（`ETH_IPV6_CONVERTED_PREFIX`、`ETH_IPV6_CONVERTED_MASK`）：IPv4-translatable IPv6地址转换得到的IPv4地址，表示一个IPv6主机；
* IPv4地址池中的地址（`ETH_IPV4_POOL_PREFIX`、`ETH_IPV4_POOL_MASK`）：普通IPv6地址的主机访问IPv4主机时分配得到的IPv4地址，表示一个IPv6主机；
* 其他普通IPv4地址，在访问IPv6主机时被转换为IPv4-converted IPv6地址。

## IPv6分组转换决策表

| 目标地址\动作/源地址  | IPv4-converted | IPv4-translatable                                | Others                                             |
| --------------------- | -------------- | ------------------------------------------------ | -------------------------------------------------- |
| **IPv4-converted**    | 非法，丢弃     | 转换，源地址、目标地址均直接转换（取地址低32位） | 转换，源地址查表，目标地址直接转换（取地址低32位） |
| **IPv4-translatable** | 非法，丢弃     | 转发                                             | 转发                                               |
| **Others**            | 非法，丢弃     | 转发                                             | 转发                                               |

## IPv4分组转换决策表

| 目标地址\动作/源地址 | IPv6-converted | IPv4 pool  | Others                                                       |
| -------------------- | -------------- | ---------- | ------------------------------------------------------------ |
| **IPv6-converted**   | 非法，丢弃     | 非法，丢弃 | 转换，源地址直接转换（前置`IPV4_CONVERTED`前缀），目标地址直接转换（前置`IPV4_TRANSLATABLE`前缀） |
| **IPv4 pool**        | 非法，丢弃     | 非法，丢弃 | 转换，源地址直接转换（前置`IPV4_CONVERTED`前缀），目标地址查表 |
| **Others**           | 非法，丢弃     | 非法，丢弃 | 转发                                                         |

## 参考文献

https://tools.ietf.org/html/rfc6144#section-3.1.1

https://tools.ietf.org/html/rfc6146