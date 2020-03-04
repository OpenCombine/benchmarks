// ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
// ┃                                                                                     ┃
// ┃                   Auto-generated from GYB template. DO NOT EDIT!                    ┃
// ┃                                                                                     ┃
// ┃                                                                                     ┃
// ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

import OpenCombine
import CombineX

#if canImport(Combine)
import Combine
#endif

import TestsUtils

private let SequenceDelivery_OpenCombine =
    BenchmarkInfo(name: "SequenceDelivery.OpenCombine",
                  runFunction: run_SequenceDelivery_OpenCombine,
                  tags: [.validation, .api])

private let SequenceDelivery_CombineX =
    BenchmarkInfo(name: "SequenceDelivery.CombineX",
                  runFunction: run_SequenceDelivery_CombineX,
                  tags: [.validation, .api])
#if canImport(Combine)
private let SequenceDelivery_Combine =
    BenchmarkInfo(name: "SequenceDelivery.Combine",
                  runFunction: run_SequenceDelivery_Combine,
                  tags: [.validation, .api])
#endif
public var SequenceDelivery: [BenchmarkInfo] {
    var tests = [BenchmarkInfo]()

    tests.append(SequenceDelivery_OpenCombine)

    tests.append(SequenceDelivery_CombineX)
#if canImport(Combine)
    tests.append(SequenceDelivery_Combine)
#endif
    return tests
}

let factor = 1000

@inline(never)
public func run_SequenceDelivery_OpenCombine(N: Int) {
    let sequenceLength = factor * N
    let sequence = OpenCombine
        .Publishers
        .Sequence<ClosedRange<Int>, Never>(sequence: 1...sequenceLength)

    var counter = 0
    _ = sequence.sink { value in
        counter += value
    }

    CheckResults(counter == sequenceLength * (sequenceLength + 1) / 2)
}


@inline(never)
public func run_SequenceDelivery_CombineX(N: Int) {
    let sequenceLength = factor * N
    let sequence = CombineX
        .Publishers
        .Sequence<ClosedRange<Int>, Never>(sequence: 1...sequenceLength)

    var counter = 0
    _ = sequence.sink { value in
        counter += value
    }

    CheckResults(counter == sequenceLength * (sequenceLength + 1) / 2)
}

#if canImport(Combine)
@inline(never)
public func run_SequenceDelivery_Combine(N: Int) {
    let sequenceLength = factor * N
    let sequence = Combine
        .Publishers
        .Sequence<ClosedRange<Int>, Never>(sequence: 1...sequenceLength)

    var counter = 0
    _ = sequence.sink { value in
        counter += value
    }

    CheckResults(counter == sequenceLength * (sequenceLength + 1) / 2)
}
#endif
