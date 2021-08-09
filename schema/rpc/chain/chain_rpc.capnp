@0xd818356d88b26728; # unique file ID, generated by `capnp id`

using Common = import "../../common.capnp";
using Protocol = import "../../protocol/protocol.capnp";
using RPC = import "../rpc.capnp";
using Json = Common.Json;

$import "/capnp/c++.capnp".namespace("koinos::rpc::chain");

using Go = import "/go.capnp";
$Go.package("chain");
$Go.import("github.com/koinos/koinos-proto-golang/koinos/rpc/chain");

struct ChainReservedRequest {}

struct SubmitBlockRequest {
   block                      @0 :Protocol.Block;
   verifyPassiveDatae         @1 :Bool;
   verifyBlockSignature       @2 :Bool;
   verifyTransactionSignature @3 :Bool;
}

struct SubmitTransactionRequest {
   transaction                @0 :Protocol.Transaction;
   verifyPassiveData          @1 :Bool;
   verifyTransactionSignature @2 :Bool;
}

struct GetHeadInfoRequest {}

struct GetChainIDRequest {}

struct GetForkHeadsRequest {}

struct ReadContractRequest
{
   contractID @0 :Data;
   entryPoint @1 :UInt32;
   args       @2 :Data;
}

struct GetAccountNonceRequest {
   account @0 :Data;
}

struct ChainRPCRequest {
   union {
      chainReserved     @0 :ChainReservedRequest;
      submitBlock       @1 :SubmitBlockRequest;
      submitTransaction @2 :SubmitTransactionRequest;
      getHeadInfo       @3 :GetHeadInfoRequest;
      getChainID        @4 :GetChainIDRequest;
      getForkHeads      @5 :GetForkHeadsRequest;
      readContract      @6 :ReadContractRequest;
      getAccountNonce   @7 :GetAccountNonceRequest;
   }
}

struct ChainReservedResponse {}

using ChainErrorResponse = RPC.ErrorResponse;

struct SubmitBlockResponse {}

struct SubmitTransactionResponse {}

struct GetHeadInfoResponse {
   headTopology          @0 :Common.BlockTopology;
   lastIrreversibleBlock @1 :Common.BlockHeightType;
}

struct GetChainIDResponse {
   chainID @0 :Common.Hash $Json.hex;
}

struct GetForkHeadsResponse {
   forkHeads             @0 :List(Common.BlockTopology);
   lastIrreversibleBlock @1 :Common.BlockTopology;
}

struct ReadContractResponse {
   result @0 :Data $Json.base64;
   logs   @1 :Text;
}

struct GetAccountNonceResponse {
   noncee @0 :UInt64;
}

struct ChainRPCResponse {
   union {
      chainReserved     @0 :ChainReservedResponse;
      chainError        @1 :ChainErrorResponse;
      submitBlock       @2 :SubmitBlockResponse;
      submitTransaction @3 :SubmitTransactionResponse;
      getHeadInfo       @4 :GetHeadInfoResponse;
      getChainID        @5 :GetChainIDResponse;
      getForkHeads      @6 :GetForkHeadsResponse;
      readContract      @7 :ReadContractResponse;
      getAccountNonce   @8 :GetAccountNonceResponse;
   }
}
