#!/usr/bin/env python3
"""
Claude-Frugal Token Calculator
Demonstrates real-world token savings from efficiency skills

IMPORTANT: This calculator uses mathematical estimates and conservative assumptions.
Results represent theoretical savings that should be validated against real API usage.

Confidence Level: Medium (mathematical model validated, empirical testing pending)

Usage:
    python token-calculator.py --scenario api-development
    python token-calculator.py --custom --files 20 --messages 60
"""

import argparse
import json
from dataclasses import dataclass
from typing import Dict, List


@dataclass
class Scenario:
    name: str
    description: str
    files_read: int
    avg_file_size: int  # lines
    messages: int
    avg_message_tokens: int
    distillations: int


SCENARIOS = {
    "api-development": Scenario(
        name="REST API Development",
        description="Building CRUD API with auth, validation, and tests",
        files_read=15,
        avg_file_size=350,
        messages=50,
        avg_message_tokens=800,
        distillations=2
    ),
    "bug-investigation": Scenario(
        name="Multi-Module Bug Investigation",
        description="Debugging issue across 5 interconnected modules",
        files_read=12,
        avg_file_size=280,
        messages=35,
        avg_message_tokens=600,
        distillations=1
    ),
    "refactoring": Scenario(
        name="Legacy Code Refactoring",
        description="Extracting microservices from monolithic controller",
        files_read=25,
        avg_file_size=420,
        messages=70,
        avg_message_tokens=900,
        distillations=3
    ),
    "documentation": Scenario(
        name="Documentation Processing",
        description="Analyzing and updating technical documentation",
        files_read=20,
        avg_file_size=150,
        messages=40,
        avg_message_tokens=700,
        distillations=1
    ),
    "codebase-review": Scenario(
        name="Full Codebase Review",
        description="Security audit and architecture assessment",
        files_read=30,
        avg_file_size=300,
        messages=55,
        avg_message_tokens=850,
        distillations=2
    )
}


class TokenCalculator:
    # Token estimation constants
    TOKENS_PER_LINE = 4  # Average tokens per line of code
    FULL_FILE_OVERHEAD = 50  # Line numbers, formatting
    SLIM_READ_OVERHEAD = 20  # Minimal context
    CONTEXT_BLOAT_MULTIPLIER = 1.3  # Repeated context in long conversations
    DISTILL_OUTPUT_TOKENS = 500  # Compressed memory output

    @classmethod
    def calculate_standard_usage(cls, scenario: Scenario) -> Dict:
        """Calculate token usage without efficiency skills"""
        # File reading: full file reads
        file_tokens = scenario.files_read * (
            scenario.avg_file_size * cls.TOKENS_PER_LINE + cls.FULL_FILE_OVERHEAD
        )

        # Conversation context
        base_conversation = scenario.messages * scenario.avg_message_tokens

        # Context bloat (repeated information)
        bloated_conversation = int(base_conversation * cls.CONTEXT_BLOAT_MULTIPLIER)

        total = file_tokens + bloated_conversation

        return {
            "file_reading": file_tokens,
            "conversation": bloated_conversation,
            "total": total,
            "breakdown": {
                "files_read": scenario.files_read,
                "avg_tokens_per_file": file_tokens // scenario.files_read if scenario.files_read > 0 else 0,
                "messages": scenario.messages,
                "avg_tokens_per_message": scenario.avg_message_tokens
            }
        }

    @classmethod
    def calculate_frugal_usage(cls, scenario: Scenario) -> Dict:
        """Calculate token usage with Claude-Frugal skills"""
        # Slim-read: 10% of full file reading
        slim_tokens = int(scenario.files_read * (
            (scenario.avg_file_size * 0.1) * cls.TOKENS_PER_LINE + cls.SLIM_READ_OVERHEAD
        ))

        # Distilled conversation: remove context bloat, compress history
        base_conversation = scenario.messages * scenario.avg_message_tokens
        distill_savings = scenario.distillations * (scenario.avg_message_tokens * 30)  # ~30 messages per distill
        compressed_conversation = base_conversation - distill_savings + (scenario.distillations * cls.DISTILL_OUTPUT_TOKENS)

        total = slim_tokens + compressed_conversation

        return {
            "file_reading": slim_tokens,
            "conversation": compressed_conversation,
            "total": total,
            "breakdown": {
                "files_read": scenario.files_read,
                "avg_tokens_per_file": slim_tokens // scenario.files_read if scenario.files_read > 0 else 0,
                "distillations": scenario.distillations,
                "tokens_saved_per_distill": distill_savings // scenario.distillations if scenario.distillations > 0 else 0
            }
        }

    @classmethod
    def calculate_savings(cls, standard: Dict, frugal: Dict) -> Dict:
        """Calculate savings metrics"""
        saved = standard["total"] - frugal["total"]
        percentage = (saved / standard["total"]) * 100 if standard["total"] > 0 else 0

        # Additional messages possible with savings (at 250 tokens/msg average)
        additional_messages = saved // 250

        # Multiplier effect
        original_capacity = 40  # Standard Pro message limit before issues
        new_capacity = original_capacity + additional_messages
        multiplier = new_capacity / original_capacity

        return {
            "tokens_saved": saved,
            "percentage": percentage,
            "additional_messages": additional_messages,
            "capacity_multiplier": multiplier,
            "money_saved_per_month": cls.estimate_money_saved(multiplier)
        }

    @staticmethod
    def estimate_money_saved(multiplier: float) -> float:
        """Estimate effective cost savings"""
        base_subscription = 20  # $20/month Pro
        effective_cost = base_subscription / multiplier
        savings = base_subscription - effective_cost
        return round(savings, 2)


def print_report(scenario: Scenario, standard: Dict, frugal: Dict, savings: Dict):
    """Print formatted comparison report"""
    print("\n" + "="*70)
    print(f"  Claude-Frugal Token Savings Calculator")
    print(f"  Confidence: Medium (theoretical estimates)")
    print("="*70)
    print(f"\n📊 Scenario: {scenario.name}")
    print(f"   {scenario.description}\n")

    print(f"📏 Task Parameters:")
    print(f"   • Files to read: {scenario.files_read} (avg {scenario.avg_file_size} lines)")
    print(f"   • Messages: {scenario.messages}")
    print(f"   • Distillations: {scenario.distillations}")

    print(f"\n🔴 Standard Approach (No Efficiency Skills):")
    print(f"   • File reading: {standard['file_reading']:,} tokens")
    print(f"   • Conversation: {standard['conversation']:,} tokens")
    print(f"   • TOTAL: {standard['total']:,} tokens")

    print(f"\n🟢 Claude-Frugal Approach (With Efficiency Skills):")
    print(f"   • File reading (slim-read): {frugal['file_reading']:,} tokens")
    print(f"   • Conversation (distilled): {frugal['conversation']:,} tokens")
    print(f"   • TOTAL: {frugal['total']:,} tokens")

    print(f"\n💰 Savings Achieved:")
    print(f"   • Tokens saved: {savings['tokens_saved']:,} tokens")
    print(f"   • Reduction: {savings['percentage']:.1f}%")
    print(f"   • Additional messages possible: +{savings['additional_messages']}")
    print(f"   • Capacity multiplier: {savings['capacity_multiplier']:.1f}x")
    print(f"   • Effective monthly savings: ${savings['money_saved_per_month']:.2f}")

    print(f"\n📈 Creative Runway Extension:")
    bar_standard = "█" * 10 + "░" * 20
    bar_frugal = "█" * 30
    print(f"   Standard: [{bar_standard}] 40 messages → Rate limited")
    print(f"   Frugal:   [{bar_frugal}] {40 + savings['additional_messages']} messages → Still productive")

    print(f"\n⚠️  Validation Status:")
    print(f"   These estimates are based on mathematical models and conservative")
    print(f"   assumptions. Real-world results may vary ±20%. See TESTING.md for")
    print(f"   validation methodology and current empirical testing status.")

    print("\n" + "="*70 + "\n")


def main():
    parser = argparse.ArgumentParser(
        description="Calculate token savings with Claude-Frugal efficiency skills"
    )
    parser.add_argument(
        "--scenario",
        choices=list(SCENARIOS.keys()),
        help="Pre-defined scenario to analyze"
    )
    parser.add_argument(
        "--custom",
        action="store_true",
        help="Use custom parameters"
    )
    parser.add_argument("--files", type=int, help="Number of files to read")
    parser.add_argument("--file-size", type=int, default=300, help="Average file size in lines")
    parser.add_argument("--messages", type=int, help="Number of messages in conversation")
    parser.add_argument("--distillations", type=int, default=1, help="Number of distillation operations")
    parser.add_argument("--json", action="store_true", help="Output as JSON")
    parser.add_argument("--all", action="store_true", help="Run all scenarios")

    args = parser.parse_args()

    calc = TokenCalculator()

    if args.all:
        print("\n" + "="*70)
        print("  Claude-Frugal: All Scenarios Comparison")
        print("="*70)

        results = []
        for scenario_key, scenario in SCENARIOS.items():
            standard = calc.calculate_standard_usage(scenario)
            frugal = calc.calculate_frugal_usage(scenario)
            savings = calc.calculate_savings(standard, frugal)
            results.append({
                "name": scenario.name,
                "savings_pct": savings['percentage'],
                "multiplier": savings['capacity_multiplier']
            })

        print(f"\n{'Scenario':<35} {'Savings':<12} {'Multiplier':<12}")
        print("-" * 70)
        for r in results:
            print(f"{r['name']:<35} {r['savings_pct']:>6.1f}%      {r['multiplier']:>6.1f}x")

        avg_savings = sum(r['savings_pct'] for r in results) / len(results)
        avg_multiplier = sum(r['multiplier'] for r in results) / len(results)
        print("-" * 70)
        print(f"{'AVERAGE':<35} {avg_savings:>6.1f}%      {avg_multiplier:>6.1f}x")
        print("="*70 + "\n")

        return

    if args.custom:
        if not args.files or not args.messages:
            parser.error("--custom requires --files and --messages")
        scenario = Scenario(
            name="Custom Scenario",
            description="User-defined parameters",
            files_read=args.files,
            avg_file_size=args.file_size,
            messages=args.messages,
            avg_message_tokens=800,
            distillations=args.distillations
        )
    elif args.scenario:
        scenario = SCENARIOS[args.scenario]
    else:
        parser.error("Specify --scenario, --custom, or --all")

    standard = calc.calculate_standard_usage(scenario)
    frugal = calc.calculate_frugal_usage(scenario)
    savings = calc.calculate_savings(standard, frugal)

    if args.json:
        output = {
            "scenario": {
                "name": scenario.name,
                "description": scenario.description,
                "parameters": {
                    "files": scenario.files_read,
                    "messages": scenario.messages,
                    "distillations": scenario.distillations
                }
            },
            "standard": standard,
            "frugal": frugal,
            "savings": savings
        }
        print(json.dumps(output, indent=2))
    else:
        print_report(scenario, standard, frugal, savings)


if __name__ == "__main__":
    main()
